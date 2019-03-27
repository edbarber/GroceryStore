# GroceryStore

To use this project you need to have the database created by executing CreateGroceryStoreDb. Make sure the connection string for GroceryStoreConnection in appsettings.json inside the API project matches the database that was just created locally. 

You will need to run the API project once every time you make changes to its code or restart visual studio otherwise it will refuse any incoming connection. Also, inside the WebApp project you will need to make sure API inside appsettings.json is set correctly before running the EmployeeWebApp project otherwise the app will deadlock.

The models for the GroceryStore database are generated using the scaffolding command referenced here https://docs.microsoft.com/en-us/ef/core/miscellaneous/cli/powershell

Make sure to delete the OnConfiguring method inside the db context C# file whenever your run the scaffolding command as the connection string is stored in appsettings.json.
