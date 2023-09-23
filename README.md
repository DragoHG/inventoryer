# inventoryer
Generates a CSV file with important system and user information for inventory management or audit.

Those files are made to be in a remote device, and be inserted on a user computer to get system and user information to generate a CSV file to include in a inventory management system.

Insert the remote device on all user computer of a floor, and it will insert in the CSV file line per line. So you can collect everything latter.

Number on the file name are the floor where the script is being executed, you need to change that on line 11 with the number of the floor too.

Inside the folder 'infos' (create this folder if it doesn't exist) will be created a subfolder with 'ComputerName/LoggedUserName' (the one who executes the script), with additional info.

The user must have permissions on basics WMIC commands.

- Fabio Monreal - fabio.monreal@outlook.com -
