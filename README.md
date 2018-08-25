# MySQL db to CSV
## Background
A quicky ruby script to dump local mysql database tables into individual csv files.

## Usage
Open `main.rb` in your text editor and replace your local db credentials in line 7 if appropriate.

Then run `ruby main.rb [your_database_name]`. This will create a folder with the provided database name and will create
csv files for all of the tables in your database.
