The Mass Lab contains specialist machines for measuring objects' weight, size and volume. Each machine writes its results to .DOC and .XLS files held on the AWS server under x:\Mass\ with each machine saving results under a specific named folder. The name of the machine will correspond with the name of the folder.

A single Windows 11 machine logs probe temperature data (up to 12 probes), humidity and pressure across the Mass Lab at 5-minute intervals. These data are stored in an AWS MySQL database, which replaced the on-prem SQL database in September 2024.

Mass Extractor and Extract Environment are the only 2 specialist Visual Basic 6 programs used here.

Extract Environment asks the user for a date range, and extracts the environmental data for that period from the AWS MySQL database, dumping it into an Excel sheet.

Mass Extractor combines information from the A5 machine, and environmental data from the AWS MySQL database, and produces PDF reports of the results for the clients.
