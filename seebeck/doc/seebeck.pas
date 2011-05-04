Tset:=Tinit;
repeat {temperature cycle}
 
 cislo:=round(Tset);
 EComPosliWrite(ETP_Target_Setpoint,cislo);
 EComPosliRead(ETP_Target_Setpoint,iCtiNic); 

 repeat {furnace temperature stabilization}
  EComPosliRead(ETP_Process_Variable,cislo);   
  Tmeas:=cislo;
 until abs(Tmeas-Tset)<0.5); 

 repeat {sample temperature stabilization}
  Tmeas:=Temp(ReadValue(109));
  for i:=1 to 9 do begin
   x[i]:=x[i+1]; y[i]:=y[i+1];
  end;
  y[10]:=Tmeas; x[10]:=ElapsedTime;
  linreg(10,x,y,a,b);
  Tslope:=b;
 until abs(TSlope)<Tslope_limit); 

 repeat {check for TP additivity} 
  Uad:=ReadValue(109);
  Udc:=ReadValue(110);
  Ucb:=ReadValue(111);
  Uab:=ReadValue(112);
  dU: =Uad+Udc+Ucb-Uab;
 until abs(dU)<dU_limit;
    
 {resistivity}
 str(cur:6:4,s);
 SetCurrent(s);
 CloseChannel('207,208'); 
 ApplyCurrent(True); KPausa(500);
 Udc:=ReadValue(110);
 ApplyCurrent(False);
 str(-cur:6:4,s);
 SetCurrent(s);
 ApplyCurrent(True); KPausa(500);
 Udc:=Udc-ReadValue(110);
 ApplyCurrent(False);
 OpenChannel('207,208'); 
 Res:=Udc/2/curr*S/d;

 {Seebeck}
 i:=0; Tmean:=0
 Set_Power(Power); {start heating}
 repeat
  inc(i);
  Udc:=ReadValue(110); {read voltage D-C}
  Td:=Temp(ReadValue(108)); Tmean:=Tmean+Td; {read T_4 - lead D}
  Tc:=Temp(ReadValue(107)); Tmean:=Tmean+Tc; {read T_3 - lead C}
  dT:=Td-Tc;
  y[i]:=Udc; x[i]:=dT;
 until abs(dT)>dT_limit;
 Set_Power(0.0); {stop heating}
 repeat
  inc(i);
  Udc:=ReadValue(110);
  Td:=Temp(ReadValue(108)); Tmean:=Tmean+Td;
  Tc:=Temp(ReadValue(107)); Tmean:=Tmean+Tc;
  dT:=Td-Tc;
  y[i]:=Udc; x[i]:=dT;
 until abs(dT)<
 linreg(i,x,y,a,b);
 Tmean:=Tmean/2/i;
 alpha:=b;    
 wrilteln(diskfile,Tmean,Res,alpha);

 Tset:=Tset+Tstep;
until Tset>Tmax;
