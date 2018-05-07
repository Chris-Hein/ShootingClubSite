using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data;
using MySql.Data.MySqlClient;

public class Admin {

    // Connection objects
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    string sqlString;

	public Admin() {
		// Initialization
	}

    //----------------------------------------------------------------------------------- Get Methods

    // Method to pull about us info from the database so it can be displayed
    public string getAboutUsData() {
        try {
            dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
            dbConnection.Open();
            sqlString = "SELECT content FROM about WHERE id = 1";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    //----------------------------------------------------------------------------------- Set Methods

    // Method to handle updating the about us section of the admin page
    public void updateAboutUs(string content) {
        try {
            dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
            dbConnection.Open();
            sqlString = "UPDATE about SET content = @content WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@content", content);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to handle adding a new news entry
    public void addNewsEntry(string date, string title, string content) {
        try {
            dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
            dbConnection.Open();
            sqlString = "INSERT INTO news (date, title, content) VALUES(@date, @title, @content)";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@date", date);
            dbCommand.Parameters.AddWithValue("@title", title);
            dbCommand.Parameters.AddWithValue("@content", content);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to handle adding a new event
    public void addEventEntry(string name, string location, string eventdate, string description, string publishdate) {
        try {
            dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
            dbConnection.Open();
            sqlString = "INSERT INTO event (name, location, eventdate, description, publishdate) VALUES(@name, @location, @eventdate, @description, @publishdate)";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@name", name);
            dbCommand.Parameters.AddWithValue("@location", location);
            dbCommand.Parameters.AddWithValue("@eventdate", eventdate);
            dbCommand.Parameters.AddWithValue("@description", description);
            dbCommand.Parameters.AddWithValue("@publishdate", publishdate);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to delete a news article
    public void deleteNews(string newsid) {
        try {
            dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
            dbConnection.Open();
            sqlString = "DELETE FROM news WHERE id=" + newsid;
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to delete an event
    public void deleteEvent(string eventid) {
        try {
            dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
            dbConnection.Open();
            sqlString = "DELETE FROM event WHERE id=" + eventid;
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }
}