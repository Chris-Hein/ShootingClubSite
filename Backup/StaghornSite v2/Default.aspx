﻿<%@ Page Language="C#" Debug="true" MaintainScrollPositionOnPostback="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<!DOCTYPE html>

<script runat="server">
    // Variables
    WebLogin weblogin;
    Admin admin;

    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataAdapter dbAdapter;
    DataSet dbDataSet;
    MySqlDataReader dbReader;
    string sqlString;

    /// Page load
    protected void page_load() {
        admin = new Admin();
        //testing
        Session.RemoveAll();

        
        //Session["homeVisibility"] = "block";

        //Session.Remove("homeVisibility");
        //Session.Remove("newsVisibility");
        
        // testing
        //string test = Session["homeVisibility"].ToString();
        //Console.Write(test);
        //Session["homeVisibility"] = "none";
        //Console.Write("home visibility: " + Session["homeVisibility"].ToString());

       
        // Checks the visibility state stored in the session
        // Handles home page visibility
        /*
        if (Session["homeVisibility"] == null) {
            // if its null it defaults to block (because its the default page to display)
            Session["homeVisibility"] = "block";
            // then it sets the display based on the block/none stored in the session
            // which in this case is block
            homePanel.Style.Add("display", Session["homeVisibility"].ToString());
            Console.Write("home visibility: " + Session["homeVisibility"].ToString());
        } else {
            // if the session is not null the display is set based on the stored state in the session
            homePanel.Style.Add("display", Session["homeVisibility"].ToString());
            Console.Write("home visibility: " + Session["homeVisibility"].ToString());
        }
         * */

        // Handles news page visibility
        // Exists to preserve the display state of the page when browsing news articles
        // otherwise the page query would reload the home page during postback
        /*
        if (Session["newsVisibility"] == null) {
            // if its null it defaults to block (because its the default page to display)
            Session["newsVisibility"] = "none";
            // then it sets the display based on the block/none stored in the session
            // which in this case is block
            newsPanel.Style.Add("display", Session["newsVisibility"].ToString());
            Console.Write("home visibility: " + Session["newsVisibility"].ToString());
        } else {
            // if the session is not null the display is set based on the stored state in the session
            newsPanel.Style.Add("display", Session["newsVisibility"].ToString());
            Console.Write("news visibility: " + Session["newsVisibility"].ToString());
        }
         * */
        
        generateLogin();
        setLoginState();

        if (!Page.IsPostBack) {
            loadData();
            
            // Populates booking dropdown
            ListItem rangeItem1;
            ListItem rangeItem2;
            rangeItem1 = new ListItem("Stellarton Range");
            rangeItem2 = new ListItem("New Glasgow Range");
            drpRanges.Items.Add(rangeItem1);
            drpRanges.Items.Add(rangeItem2);
            
            // Defaults home button to selected color
            //btnHome.CssClass = "btn btn-warning";

            //Console.Write("home visibility: " + Session["homeVisibility"].ToString());

            /*
            if (Session["homeVisibility"] == null) {
                Session["homeVisibility"] = "block";
            } else {
                homePanel.Style.Add("display", Session["homeVisibility"].ToString());
            }
             * */
            
        }
        
        //loadData();
    }

    protected void loadData() {
        // Loads the data for the about us section
        lblAboutUs.Text = Convert.ToString(admin.getAboutUsData());
        displayEvents();
        displayNews();
        displayImages();
    }

    protected void setLoginState() {
        if (Session["username"] != null) {
            //lblLogin.Text = "Log Out";
            lblCurrentUser.Text = "You are logged in as " + Session["username"].ToString();
            //btnLogin.Text = "Logout";
        } else {
            //lblLogin.Text = "Log In";
            lblCurrentUser.Text = "You are not logged in";
            //btnLogin.Text = "Login";
        }
    }

    // Method to handle email generation for bookings
    protected string bookingMessageText() {
        // Variables
        string name = Server.HtmlEncode(txtBookName.Text);
        string range = Convert.ToString(drpRanges.SelectedValue);
        string email = Server.HtmlEncode(txtBookEmail.Text);
        string phone = Server.HtmlEncode(txtBookPhone.Text);
        string date = Server.HtmlEncode(txtBookDate.Text);
        string time = Server.HtmlEncode(txtBookTime.Text);
        string message;
        // Generates the email text
        message = "This is an automated booking message from the staghorn shooting club website." + name + " would like to book the " + range + " range, on " + date + " at " + time + ". Their contact information is: " + phone + " (phone), " + email + " (email).";

        return message;
    }

    // Method to handle generating the emails for booking a range
    protected void bookingMailer(Object src, EventArgs args) {
        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage("Automated Booking", "shootingclub@shootingclubemail.com", "Automated booking message from Staghorn Shooting Club Website", bookingMessageText());
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred = new NetworkCredential("mail@hotmail.com", "password");
        // Can be setup for gmail by using smtp.google.com
        SmtpClient smtpobj = new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }

    // Method to generate the body text of automated messages
    protected string messagetext() {
        string message;

        message = Server.HtmlEncode(txtContactMessage.Text.ToString());

        return message;
    }

    // Method to handle sending messages to the club via the website contact us form
    // Note this is not set up to function properly yet, actual account data needs to 
    // be entered for the form to function
    protected void automatedMailer(Object src, EventArgs args) {
        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage(txtContactName.Text.ToString(), "shootingclub@shootingclubemail.com", "Automated message from Staghorn Shooting Club Website", messagetext());
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred = new NetworkCredential("mail@hotmail.com", "password");
        // Can be setup for gmail by using smtp.google.com
        SmtpClient smtpobj = new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }

    protected void facebook(Object src, EventArgs args) {
        Response.Redirect("https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/");
    }

    protected void userLogout(Object src, EventArgs args) {
        Session.Remove("username");
        Session.Remove("weblogin");
        Response.Redirect("Default.aspx");
    }

    protected void userLogin(Object src, EventArgs args) {
        weblogin.username = txtUsername.Text;
        weblogin.password = txtPassword.Text;

        if (weblogin.unlock()) {
            Session["username"] = txtUsername.Text;
            Response.Redirect("admin.aspx");
        } else {
            lblLoginError.Text = "Invalid username/password";
        }
    }

    protected void generateLogin() {
        if ((!Page.IsPostBack) || (Session["weblogin"] == null)) {
            // First visit
            // DB name, username, password, table
            weblogin = new WebLogin("login", "root", "", "login");
            Session["weblogin"] = weblogin;
        } else {
            // Postback
            weblogin = (WebLogin)Session["weblogin"];
        }
    }

    protected void displayNews() {
        dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
        sqlString = "SELECT * FROM news WHERE id > 0 ORDER BY id DESC";
        dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
        DataTable table = new DataTable();
        dbAdapter.Fill(table);

        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = table.DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 4;

        int currentPage;

        if (Request.QueryString["page2"] != null) {
            currentPage = Int32.Parse(Request.QueryString["page2"]);
        } else {
            currentPage = 1;
        }

        pds.CurrentPageIndex = currentPage - 1;
        lblPageInfo2.Text = "Page " + currentPage + " of " + pds.PageCount;

        if (!pds.IsFirstPage) {
            linkPrev2.NavigateUrl = Request.CurrentExecutionFilePath + "?page2=" + (currentPage - 1);
        } else {
        }

        // Grays out the previous navigation if the user is on the first entry
        if (pds.IsFirstPage) {
            linkPrev2.Style.Add("background-color", "gray");
            linkPrev2.Style.Add("color", "darkgray");
            linkPrev2.Style.Add("background-color", "gray");
            linkPrev2.Style.Add("color", "darkgray");
        }

        // Grays out the next navigation if the user is on the last entry
        if (pds.IsLastPage) {
            linkPrev2.Style.Add("background-color", "darkolivegreen");
            linkPrev2.Style.Add("color", "white");
            linkNext2.Style.Add("background-color", "gray");
            linkNext2.Style.Add("color", "darkgray");
        }

        if (!pds.IsLastPage) {
            linkNext2.NavigateUrl = Request.CurrentExecutionFilePath + "?page2=" + (currentPage + 1);
        }
        // Binding the data to the repeater
        repDisplayNews.DataSource = pds;
        repDisplayNews.DataBind();
    }
    
    // Sets up the loading and paging for events
    protected void displayEvents() {
        dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
        sqlString = "SELECT * FROM event WHERE id > 0 ORDER BY id DESC";
        dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
        DataTable table = new DataTable();
        dbAdapter.Fill(table);

        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = table.DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 1;

        int currentPage;

        if (Request.QueryString["page"] != null) {
            currentPage = Int32.Parse(Request.QueryString["page"]);
        } else {
            currentPage = 1;
        }

        pds.CurrentPageIndex = currentPage - 1;
        lblPageInfo1.Text = "Event " + currentPage + " of " + pds.PageCount;

        if (!pds.IsFirstPage) {
            linkPrev1.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage - 1);
        } else {
            
        }

        // Grays out the previous navigation if the user is on the first entry
        if (pds.IsFirstPage) {
            linkPrev1.Style.Add("background-color", "gray");
            linkPrev1.Style.Add("color", "darkgray");
            linkPrev1.Style.Add("background-color", "gray");
            linkPrev1.Style.Add("color", "darkgray");
        }

        // Grays out the next navigation if the user is on the last entry
        if (pds.IsLastPage) {
            linkPrev1.Style.Add("background-color", "darkolivegreen");
            linkPrev1.Style.Add("color", "white");
            linkNext1.Style.Add("background-color", "gray");
            linkNext1.Style.Add("color", "darkgray");
        }

        if (!pds.IsLastPage) {
            linkNext1.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
        }
        // Binding the data to the repeater
        repDisplayEvents.DataSource = pds;
        repDisplayEvents.DataBind();
    }

    protected void displayImages() {
        dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
        sqlString = "SELECT * FROM images WHERE id > 0 ORDER BY id DESC";
        dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
        DataTable table = new DataTable();
        dbAdapter.Fill(table);

        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = table.DefaultView;
        pds.AllowPaging = true;
        // Displays 9 images per page
        pds.PageSize = 9;

        int currentPage;

        if (Request.QueryString["pageee"] != null) {
            currentPage = Int32.Parse(Request.QueryString["pageee"]);
        } else {
            currentPage = 1;
        }

        pds.CurrentPageIndex = currentPage - 1;
        lblPageInfoImage.Text = "Page " + currentPage + " of " + pds.PageCount;

        if (!pds.IsFirstPage) {
            linkPrevImage.NavigateUrl = Request.CurrentExecutionFilePath + "?pageee=" + (currentPage - 1);
            //homePanel.Style.Add("display", "none");
            //galleryPanel.Style.Add("display", "block");
        }

        // Grays out the previous navigation if the user is on the first entry
        if (pds.IsFirstPage) {
            linkPrevImage.Style.Add("background-color", "gray");
            linkPrevImage.Style.Add("color", "darkgray");
            linkPrevImage.Style.Add("background-color", "gray");
            linkPrevImage.Style.Add("color", "darkgray");
        }

        // Grays out the next navigation if the user is on the last entry
        if (pds.IsLastPage) {
            linkPrevImage.Style.Add("background-color", "darkolivegreen");
            linkPrevImage.Style.Add("color", "white");
            linkNextImage.Style.Add("background-color", "gray");
            linkNextImage.Style.Add("color", "darkgray");
        }

        if (!pds.IsLastPage) {
            linkNextImage.NavigateUrl = Request.CurrentExecutionFilePath + "?pageee=" + (currentPage + 1);
            //homePanel.Style.Add("display", "none");
            //galleryPanel.Style.Add("display", "block");
        }

        // Added to facilitate deleting images
        //lblCurrentImage.Text = Convert.ToString(currentPage);

        // Binding the data to the repeater
        repDisplayImages.DataSource = pds;
        repDisplayImages.DataBind();
    }
    
    protected void selectHome(Object src, EventArgs args) {
        if (homePanel.Style["display"] == "none") {
            homePanel.Style.Add("display", "block");
            btnHome.CssClass = "btn btn-warning";
            // Sets the session to block
          //  Session["homeVisibility"] = "block";
         //   Console.Write(Session["homeVisibility"].ToString());
            // Close any other panels on the page when a selection is made
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        } else {
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
            // sets the session to none
            Session["homeVisibility"] = "none";
            Console.Write(Session["homeVisibility"].ToString());
        }
        //Console.Write("homeVisibility: " + Session["homeVisibility"].ToString());
    }

    protected void selectNews(Object src, EventArgs args) {
        if (newsPanel.Style["display"] == "none") {
            newsPanel.Style.Add("display", "block");
            btnNews.CssClass = "btn btn-warning";
            // Sets the session to block
         //   Session["newsVisibility"] = "block";
        //    Console.Write(Session["newsVisibility"].ToString());
            // Close any other panels on the page when a selection is made
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        } else {
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            Session["newsVisibility"] = "none";
            Console.Write(Session["newsVisibility"].ToString());
        }
    }

    protected void selectAbout(Object src, EventArgs args) {
        if (aboutPanel.Style["display"] == "none") {
            aboutPanel.Style.Add("display", "block");
            btnAbout.CssClass = "btn btn-warning";
            // Close any other panels on the page when a selection is made
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        } else {
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
        }
    }

    protected void selectCalendar(Object src, EventArgs args) {
        if (calendarPanel.Style["display"] == "none") {
            calendarPanel.Style.Add("display", "block");
            btnCalendar.CssClass = "btn btn-warning";
            // Close any other panels on the page when a selection is made
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        } else {
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
        }
    }

    protected void selectLinks(Object src, EventArgs args) {
        if (linksPanel.Style["display"] == "none") {
            linksPanel.Style.Add("display", "block");
            btnLinks.CssClass = "btn btn-warning";
            // Close any other panels on the page when a selection is made
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        } else {
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
        }
    }

    protected void selectContactUs(Object src, EventArgs args) {
        if (contactPanel.Style["display"] == "none") {
            contactPanel.Style.Add("display", "block");
            btnContact.CssClass = "btn btn-warning";
            // Close any other panels on the page when a selection is made
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        } else {
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
        }
    }

    protected void selectMembership(Object src, EventArgs args) {
        if (membershipPanel.Style["display"] == "none") {
            membershipPanel.Style.Add("display", "block");
            btnMembership.CssClass = "btn btn-warning";
            // Close any other panels on the page when a selection is made
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
        } else {
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        }
    }

    protected void selectGallery(Object src, EventArgs args) {
        if (galleryPanel.Style["display"] == "none") {
            galleryPanel.Style.Add("display", "block");
            btnGallery.CssClass = "btn btn-warning";
            // Close any other panels on the page when a selection is made
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-success";
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-success";
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-success";
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-success";
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        } else {
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-success";
        }
    }

    protected void selectLogin(Object src, EventArgs args) {
        if (loginPanel.Style["display"] == "none") {
            loginPanel.Style.Add("display", "block");
            //lblLogin.CssClass = "btn btn-warning";
        } else {
            loginPanel.Style.Add("display", "none");
            //lblLogin.CssClass = "btn btn-warning";
        }
    }

    protected void selectCourses1(Object src, EventArgs args) {
        if (coursesPanel1.Style["display"] == "none") {
            coursesPanel1.Style.Add("display", "block");
        } else {
            coursesPanel1.Style.Add("display", "none");
        }
    }

    protected void selectCourses2(Object src, EventArgs args) {
        if (coursesPanel2.Style["display"] == "none") {
            coursesPanel2.Style.Add("display", "block");
        } else {
            coursesPanel2.Style.Add("display", "none");
        }
    }

    protected void selectCourses3(Object src, EventArgs args) {
        if (coursesPanel3.Style["display"] == "none") {
            coursesPanel3.Style.Add("display", "block");
        } else {
            coursesPanel3.Style.Add("display", "none");
        }
    }

    protected void selectCourses4(Object src, EventArgs args) {
        if (coursesPanel4.Style["display"] == "none") {
            coursesPanel4.Style.Add("display", "block");
        } else {
            coursesPanel4.Style.Add("display", "none");
        }
    }

    protected void selectBooking(Object src, EventArgs args) {
        if (calendarPanel.Style["display"] == "none") {
            calendarPanel.Style.Add("display", "block");
        } else {
            calendarPanel.Style.Add("display", "none");
        }
    }

    

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staghorn Shooting Club - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
     <!-- jQuery library -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <!-- Latest compiled JavaScript -->
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- Font Awesome stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- Google icon stylesheet -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXaxu38FBkmm3_ekVqu6IpCDIWY6yOyxI&callback=initMap"></script>
    <!-- site stylesheet -->
    <link rel="stylesheet" href="styles.css" />
    <!-- Adds logo icon to the browser tab -->
    <link rel="shortcut icon" type="image/x-icon" href="~/images/stagtitle.jpg" />

    <script type="text/javascript">
        $(document).ready(function () {
            // Toggles sliding the home panel open and closed
            $("#btnHome").click(function () {
                $("#homePanel").slideToggle("fast");
            });

            // Toggles sliding the news panel open and closed
            $("#btnNews").click(function () {
                $("#newsPanel").slideToggle("fast");
            });

            // Toggles sliding the about panel open and closed
            $("#btnAbout").click(function () {
                $("#aboutPanel").slideToggle("fast");
            });

            // Toggles sliding the calendar panel open and closed
            $("#btnCalendar").click(function () {
                $("#calendarPanel").slideToggle("fast");
            });

            // Toggles sliding the links panel open and closed
            $("#btnLinks").click(function () {
                $("#linksPanel").slideToggle("fast");
            });

            // Toggles sliding the contact panel open and closed
            $("#btnContact").click(function () {
                $("#contactPanel").slideToggle("fast");
            });

            // Toggles sliding the buy membership panel open and closed
            $("#btnMembership").click(function () {
                $("#membershipPanel").slideToggle("fast");
            });

            // Toggles sliding the login panel open and closed
            $("#imgTitle").click(function () {
                $("#loginPanel").slideToggle("fast");
            });

            $("#imgCourses1").click(function () {
                $("#coursesPanel1").slideToggle("fast");
            });

            $("#imgCourses2").click(function () {
                $("#coursesPanel2").slideToggle("fast");
            });

            $("#imgCourses3").click(function () {
                $("#coursesPanel3").slideToggle("fast");
            });

            $("#imgCourses4").click(function () {
                $("#coursesPanel4").slideToggle("fast");
            });

            $("#btnBook").click(function () {
                $("#calendarPanel").slideToggle("fast");
            });

            $("#btnGallery").click(function () {
                $("#galleryPanel").slideToggle("fast");
            });

            // Handles button enabling/disabling
            // Variables
            var $input = $('input:text');
            var $submit = $('#btnSubmit');

            var $input1 = $('contact:text');
            //var $submit1 = $('#btnContactSend');
            // Defaults button to disabled
            $submit.attr('disabled', true);
            //$submit1.attr('disabled', true);
            // Sets the border of the input to boxes to red by default 
            $input.css("border", "1px solid red");
            //$input1.css("border", "1px solid red");
            // Checks for empty values on each keyup
            // Uses a loop to go through each input box
            // and checks to see if there is no value,
            // if there is no value, triggers the disabled
            // condition, which keeps the button disabled
            // via the ternary operator
            $input.keyup(function () {
                var disabled = false;
                $input.each(function () {
                    if (!$(this).val()) {
                        disabled = true;
                        // Sets the border color of the input boxes to red if not filled out
                        $(this).css("border", "1px solid red");
                    } else {
                        // Otherwise sets the border color to green to show they are
                        $(this).css("border", "1px solid #39FF14");
                    }
                });
                // Ternary operator to handle enabling and disabling button
                disabled ? $submit.attr('disabled', true) : $submit.removeAttr('disabled');
            });

            // Handles implementation of google maps functionality
            // Also handles adding markers for range locations and
            // locations you can buy a membership
            // Note: ALL map related functionality is coded here, including
            // stuff that shows up in different divs
            // Note: lat/long can be pulled from this site: https://www.latlong.net/convert-address-to-lat-long.html
            window.initMap = function () {
                // 24 Reeves Rd, New Glasgow, NS B2H 5C7
                var range1 = { lat: 45.552684, lng: -62.589297 };
                // 40 Foster Ave, Stellarton, NS B0K 1S0
                var range2 = { lat: 45.564594, lng: -62.663941 };
                // Membership purchasing location coords
                var canadianTireNG = { lat: 45.580281, lng: -62.665395 };
                var abercrombieVideo = { lat: 45.605168, lng: -62.653849 };
                var woodsWaterWestville = { lat: 45.549766, lng: -62.711393 };
                var terryPawnshop = { lat: 45.364005, lng: -63.276183 };

                var buyLocations = new google.maps.Map(document.getElementById('memberMap'), {
                    zoom: 9,
                    center: canadianTireNG
                });

                var shootingRanges2 = new google.maps.Map(document.getElementById('contactMap'), {
                    zoom: 12,
                    center: range1
                });

                var shootingRanges3 = new google.maps.Map(document.getElementById('bookMap'), {
                    zoom: 12,
                    center: range2
                });

                var shootingRanges = new google.maps.Map(document.getElementById('locMap'), {
                    zoom: 12,
                    center: range2
                });

                //------------------------------------------------------------ Markers - Purchasing Locations

                // Canadian Tire New Glasgow
                var marker = new google.maps.Marker({
                    position: canadianTireNG,
                    map: buyLocations,
                    label: { text: 'Canadian Tire New Glasgow', color: '#5fd615' },
                });

                // Abercrombie Video
                var marker = new google.maps.Marker({
                    position: abercrombieVideo,
                    map: buyLocations,
                    label: { text: 'Abercrombie Video', color: '#5fd615' }
                });

                // Woods and Water Westville
                var marker = new google.maps.Marker({
                    position: woodsWaterWestville,
                    map: buyLocations,
                    label: { text: 'Woods and Water Westville', color: '#5fd615' }
                });

                // Terrys Pawn Shop
                var marker = new google.maps.Marker({
                    position: terryPawnshop,
                    map: buyLocations,
                    label: { text: 'Terrys Pawn Shop', color: '#5fd615' }
                });

                //------------------------------------------------------------ Markers - Range Locations

                var marker = new google.maps.Marker({
                    position: range1,
                    map: shootingRanges2,
                    label: { text: '24 Reeves Rd, New Glasgow', color: '#5fd615' },
                });

                var marker = new google.maps.Marker({
                    position: range2,
                    map: shootingRanges2,
                    label: { text: '40 Foster Ave, Stellarton', color: '#5fd615' }
                });

                //------------------------------------------------------------ Markers - Range Locations

                var marker = new google.maps.Marker({
                    position: range1,
                    map: shootingRanges,
                    label: { text: '24 Reeves Rd, New Glasgow', color: '#5fd615' },
                });

                var marker = new google.maps.Marker({
                    position: range2,
                    map: shootingRanges,
                    label: { text: '40 Foster Ave, Stellarton', color: '#5fd615' }
                });

                //------------------------------------------------------------ Markers - Range Locations

                var marker = new google.maps.Marker({
                    position: range1,
                    map: shootingRanges3,
                    label: { text: '24 Reeves Rd, New Glasgow', color: '#5fd615' },
                });

                var marker = new google.maps.Marker({
                    position: range2,
                    map: shootingRanges3,
                    label: { text: '40 Foster Ave, Stellarton', color: '#5fd615' }
                });
            }

        });
    </script>
</head>
<body>
    <form runat="server">
    <div class="container2 col-sm-12 well">
        <div class="container col-sm-1">
            <asp:Image class="img-rounded img-responsive" ID="imgTitle" ImageUrl="images/stagtitle.jpg" Height="60px" Width="60px" runat="server" AlternateText="Staghorn" />
        </div>
        <div class="container col-sm-11" style="margin-top:10px;">
            <asp:Label ID="lblTitle" Text="Staghorn Shooting Club" Font-Size="30px" ForeColor="black" runat="server" />
            <br /><br /><br /><br />
        </div>

        <div class="container1 col-sm-12 well">
            <asp:Label ID="lblCurrentUser" Text="" runat="server" />
        </div>
        <!-- Login Panel -->
        <div id="loginPanel" class="container col-sm-3" runat="server" style="display:none">
            
            <div class="container1 col-sm-10 well btn-group " style="text-align:center;">
                <asp:TextBox ID="txtUsername" placeholder="username" Text="username" CssClass="form-control" MaxLength="12" runat="server" />
                <asp:TextBox ID="txtPassword" placeholder="password" Text="password" CssClass="form-control" MaxLength="12" runat="server" />
                <br />
                <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-success" OnClick="userLogin" runat="server" />
                <asp:Button ID="btnLogout" Text="Logout" CssClass="btn btn-success" OnClick="userLogout" runat="server" />
                <asp:Label ID="lblLoginError" Text="" CssClass="text text-danger" Font-Size="XX-Small" runat="server" />
            </div>

            <div class="container col-sm-9 ">

            </div>
        </div>
        
        <div class="container2 col-sm-12 well btn-group btn-group-justified" style="text-align:center">
            <asp:Button type="button" ID="btnHome" OnClientClick="return false" Text="The Club" CssClass="btn btn-success" Width="150px" OnClick="selectHome" runat="server" />
            <asp:Button type="button" ID="btnNews" OnClientClick="return false" Text="News" CssClass="btn btn-success" Width="150px" OnClick="selectNews" runat="server" />
            <asp:Button type="button" ID="btnAbout" OnClientClick="return false" Text="About" CssClass="btn btn-success" Width="150px" OnClick="selectAbout" runat="server" />
            <asp:Button type="button" ID="btnCalendar" OnClientClick="return false" Text="Book"  CssClass="btn btn-success" Width="150px" OnClick="selectCalendar" runat="server" />
            <asp:Button type="button" ID="btnLinks" OnClientClick="return false" Text="Links"  CssClass="btn btn-success" Width="150px" OnClick="selectLinks" runat="server" />
            <asp:Button type="button" ID="btnGallery" OnClientClick="return false" Text="Gallery"  CssClass="btn btn-success" Width="150px" OnClick="selectGallery" runat="server" />
            <asp:Button type="button" ID="btnContact" OnClientClick="return false" Text="Contact Us"  CssClass="btn btn-success" Width="150px" OnClick="selectContactUs" runat="server" />
            <asp:Button type="button" ID="btnMembership" OnClientClick="return false" Text="Buy Membership"  CssClass="btn btn-success" Width="150px" OnClick="selectMembership" runat="server" />
        </div>

        <div id="homePanel" class="container2 col-sm-12 well" style="display:block" runat="server">
        <div class="container col-sm-12">
            <div class="container col-sm-3 blackText" style="text-align:center;">
                <asp:Image class="img-rounded img-responsive" ID="imgRange" ImageUrl="images/rangenew.jpg" Height="200px" Width="610px" runat="server" AlternateText="range" />
                Established 1976
            </div>
            <div class="container1 col-sm-6 well">
                <asp:Label ID="lblHomeTitle" Text="Welcome to Staghorn Shooting Club" runat="server" /><br /><br />
                <asp:Label ID="lblHomeContent" Text="Bacon ipsum dolor amet leberkas ullamco duis eu, beef reprehenderit strip steak cillum bresaola in magna pork chop t-bone buffalo cupim. Incididunt sunt ea lorem short loin landjaeger. Bacon ipsum dolor amet leberkas ullamco duis eu, beef reprehenderit strip steak cillum bresaola in magna pork chop t-bone buffalo cupim. Incididunt sunt ea lorem short loin landjaeger." runat="server" />
                <br /><br /><br />
            </div>
            <div class="container col-sm-3 ">
                <asp:Image class="img-rounded img-responsive" ID="imgCourses1" ImageUrl="images/coursesplaceholder2.jpg" Height="200px" Width="610px" runat="server" AlternateText="range" />
            </div>
            <div class="container col-sm-12" style="text-align:left; color:black">
                <!-- Established 1976 -->
            </div>
        </div>

            <div id="coursesPanel1" class="container2 col-sm-12" style="display:none;" runat="server">
                <div class="container2 col-sm-8">

                </div>
                <div class="container1 col-sm-4 well">
                    <asp:Label ID="lblCoursesTitle1" Text="These are the courses the club offers: " runat="server" /><br /><br />
                    <a href="https://novascotia.ca/natr/hunt/firearms.asp" style=" text-decoration:none; color:white; font-weight:bold">Canadian Firearms Safety Course</a><br />
                    <a href="http://www.safetyservicesns.ca/restricted-firearms-safety/" style=" text-decoration:none; color:white; font-weight:bold">Restricted Firearms Safety Course</a><br />
                    <a href="https://www.huntercourse.com/canada/novascotia/?gclid=EAIaIQobChMIro384d7a2gIVDP5kCh24-ww8EAEYASAAEgJ8o_D_BwE" style=" text-decoration:none; color:white; font-weight:bold">Hunting and Crossbow Safety Course</a><br />
                </div>
            </div>

            <div class="container col-sm-2 header" style="text-align:center; color:black">
                Book a session
            </div>
            <div class="container col-sm-4 header" style="text-align:center; color:black">
                Events
            </div>
            <div class="container col-sm-6 header" style="text-align:center; color:black">
                Location
            </div>
 <!-- --><div class="container col-sm-12">
            <div class="container1 col-sm-2 well1 equal-test" style="text-align:center">
                <asp:Label ID="lblCalendarIcon" CssClass="fa fa-calendar positioning" ForeColor="black" Font-Size="90px" runat="server" /><br /><br />
                <div class="container1 col-sm-12 well">
                    <asp:Label ID="lblCalendarInfo" Text="Click the button below to book a session at one of our shooting ranges" runat="server" />
                </div>
                
                <!--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />-->
                <asp:Button ID="btnBook" Text="Book" OnClick="selectBooking" OnClientClick="return false" CssClass="btn btn-success" runat="server" /><br />
            </div>

            <div class="container1 col-sm-4 well equal-test">
                <!-- Start Display Data -->
                    <!-- Repeater to display the existing events -->
                    <asp:repeater id="repDisplayEvents" runat="server">
                    <HeaderTemplate>
                            <thead>
                             </thead>
                              <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>  
                                <div id="displayEvents" class="news well2" style="text-align:center; padding:2px; color:black;">
                                    <td>
                                        <asp:Label ID="lblEventNameTitle" Text="Name of Event: " ForeColor="white" Font-Bold="true" runat="server" />
                                        <asp:Label ID="lblEventName" Text='<%# Eval("name") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEventLocationTitle" Text="Location of Event: " ForeColor="white" Font-Bold="true" runat="server" />
                                        <asp:Label ID="lblEventLocation" Text='<%# Eval("location") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEventDateTitle" Text="Date of Event: " ForeColor="white" Font-Bold="true" runat="server" />
                                        <asp:Label ID="lblEventDate" Text='<%# Eval("eventdate") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEventDescriptionTitle" Text="Description of Event: " ForeColor="white" Font-Bold="true" runat="server" /><br />
                                        <asp:Label ID="lblEventDescription" Text='<%# Eval("description") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEventPublishedTitle" Text="This event was published: " ForeColor="white" Font-Bold="true" runat="server" />
                                        <asp:Label ID="lblEventPublished" Text='<%# Eval("publishdate") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                             </tbody>
                        </FooterTemplate>
                      </asp:repeater>
                    <!-- Navigation -->
                    <div class="col-sm-12" style="text-align:center;">
                        <ul class="pager">
                            <li><asp:HyperLink ID="linkPrev1" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server"><<</asp:HyperLink></li>
                            <li><asp:Label ID="lblPageInfo1" ForeColor="white" BackColor="darkolivegreen" runat="server" /></li>
                            <li><asp:HyperLink ID="linkNext1" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server">>></asp:HyperLink></li>
                        </ul><br />
                    </div> 
                    <!-- End Display Data -->
            </div>

            <div class="container1 col-sm-6 well equal-test">
                <div id="locMap" class="container1 col-sm-12 well" style="width:100%;height:370px;background-color:gray;">
                    Error: Google Maps API failed to load
                </div>
            </div>

<!-- --></div>

            <div class="container col-sm-12">
            <div class="container1 col-sm-8 well equal-test1">
                <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                <asp:Label ID="Label8" Text="239 West River East Side Road, West River Station, NS, B0K 1Z0" CssClass="instructions" runat="server" />
            </div>
                <div class="container1 col-sm-4 well equal-test1" style="text-align:center;">
                    <br />
                    <asp:Label ID="Label9" Text="Copyright 2018 Staghorn Shooting Club" CssClass="instructions" runat="server" />
                    <br /><br />
                </div>
            </div>
            </div>

        </div>
        <div id="newsPanel" class="container1 col-sm-12 well" style="display:none;" runat="server">
            <!-- Start Display Data -->
                    <!-- Repeater to display the existing events -->
                    <asp:repeater id="repDisplayNews" runat="server">
                    <HeaderTemplate>
                            <thead>
                             </thead>
                              <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>  
                                <div id="displayEvents" class="news well" style="text-align:center; padding:2px; color:black;">
                                    <td>
                                        <asp:Label ID="lblEventNewsDateTitle" Text="Date: " ForeColor="white" Font-Bold="true" runat="server" /><br />
                                        <asp:Label ID="lblEventNewsDate" Text='<%# Eval("date") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEventNewsTitle" Text="Title: " ForeColor="white" Font-Bold="true" runat="server" /><br />
                                        <asp:Label ID="lblEventNews" Text='<%# Eval("title") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEventNewsArticleTitle" Text="Article: " ForeColor="white" Font-Bold="true" runat="server" /><br />
                                        <asp:Label ID="lblEventNewsArticle" Text='<%# Eval("content") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                             </tbody>
                        </FooterTemplate>
                      </asp:repeater>
                    <!-- Navigation -->
                    <div id="divNewsPager" class="col-sm-12" style="text-align:center; color:black;" runat="server">
                        <ul class="pager">
                            <li><asp:HyperLink ID="linkPrev2"   Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server"><<</asp:HyperLink></li>
                            <li><asp:Label ID="lblPageInfo2" ForeColor="white" BackColor="darkolivegreen" runat="server" /></li>
                            <li><asp:HyperLink ID="linkNext2" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server">>></asp:HyperLink></li>
                        </ul><br />
                    </div> 
                    <!-- End Display Data -->
        </div>
        <div id="aboutPanel" class="container2 col-sm-12 well" style="display:none;" runat="server">
            <div class="container col-sm-8">
                <asp:Image class="img-rounded img-responsive" ID="imgAbout" ImageUrl="images/about.jpg" Height="200px" Width="1200px" runat="server" AlternateText="about us" />
                <br /><br /><br /><br />
            </div>
            <div class="container col-sm-4">
                <asp:ImageButton class="img-rounded img-responsive" OnClick="facebook" ID="imgFacebook1" ImageUrl="images/facebook.jpg" Height="90px" Width="610px" runat="server" AlternateText="facebook" />
      
                <asp:Image class="img-rounded img-responsive" ID="imgCourses2" ImageUrl="images/coursesplaceholder2.jpg" Height="200px" Width="610px" runat="server" AlternateText="courses" />
                <br />
            </div>

            <div id="coursesPanel2" class="container2 col-sm-12" style="display:none;" runat="server">
                <div class="container2 col-sm-8">

                </div>
                <div class="container1 col-sm-4 well">
                    <asp:Label ID="Label10" Text="These are the courses the club offers: " runat="server" /><br /><br />
                    <a href="https://novascotia.ca/natr/hunt/firearms.asp" style=" text-decoration:none; color:white; font-weight:bold">Canadian Firearms Safety Course</a><br />
                    <a href="http://www.safetyservicesns.ca/restricted-firearms-safety/" style=" text-decoration:none; color:white; font-weight:bold">Restricted Firearms Safety Course</a><br />
                    <a href="https://www.huntercourse.com/canada/novascotia/?gclid=EAIaIQobChMIro384d7a2gIVDP5kCh24-ww8EAEYASAAEgJ8o_D_BwE" style=" text-decoration:none; color:white; font-weight:bold">Hunting and Crossbow Safety Course</a><br />
                </div>
            </div>

            <div class="container col-sm-10" style="text-align:right">
                <asp:Label ID="lblExecutivesLabel" Text="Club Executives" style="font-weight:bold" runat="server" />
            </div>
            <div class="container col-sm-2" style="text-align:right">
                <br />
            </div>

            <div class="container1 col-sm-6 well3">
                <asp:Label ID="lblAboutUs" Text="" CssClass="positioning" runat="server" />
                
               <!-- <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> -->
            </div>

            <div class="container1 col-sm-6 well3">
                <table class="table positioning">
                    <tr>
                        <th>Name</th>
                        <th>Title</th>
                    </tr>
                    <tr>
                        <td>Nancy MacGregor</td>
                        <td>President</td>
                    </tr>
                    <tr>
                        <td>Dan MacDonald</td>
                        <td>Vice President</td>
                    </tr>
                    <tr>
                        <td>Ken Carpenter Sr</td>
                        <td>Secretary</td>
                    </tr>
                    <tr>
                        <td>Bob Stackhouse</td>
                        <td>Treasurer</td>
                    </tr>
                </table>
                <br /><br /><br />
            </div>

            <!-- its a hack to add a space between the content and the page footer but it works -->
            <div class="container col-sm-12">
                <asp:Label ID="lblBlank" Text="a" ForeColor="darkseagreen" runat="server" />
            </div>

            <div class="container1 col-sm-8 well equal-test1">
                <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                <asp:Label ID="Label1" Text="239 West River East Side Road, West River Station, NS, B0K 1Z0" CssClass="instructions" runat="server" />
            </div>
                <div class="container1 col-sm-4 well equal-test1" style="text-align:center;">
                    <br />
                    <asp:Label ID="Label4" Text="Copyright 2018 Staghorn Shooting Club" CssClass="instructions" runat="server" />
                    <br /><br />
                </div>
            </div>
        <div id="calendarPanel" class="container2 col-sm-12 well" style="display:none;" runat="server">
            <div class="container2 col-sm-12 well">
                Use the form below to send a booking request to the club at either of our ranges
            </div>
            <!-- BUG: this seems to be breaking the button functionality for the site. Might have to port this over from a mailto to an auto emailer -->
            <div class="container1 col-sm-6 well">
                <!-- <form action="mailto:mail@mail.com" method="post" enctype="text/plain"> -->
                    <asp:Label ID="Label13" Text="Full Name" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="txtBookName" placeholder="enter your name" Text="name" CssClass="form-control" MaxLength="100" runat="server" />
                    <!-- <input type="text" name="txtBookName" value="name" class="form-control" /> -->
                    <br />
                    <asp:Label ID="Label18" Text="Select Range" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:DropDownList ID="drpRanges" CssClass="form-control" runat="server" />    
                    <!--<select name="location" class="form-control">
                        <option value="NewGlasgowRange">New Glasgow Range</option>
                        <option value="StellartonRange">Stellarton Range</option>
                    </select> -->  
                    <br />
                    <asp:Label ID="Label14" Text="Email Address" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="txtBookEmail" placeholder="enter your email" Text="email" CssClass="form-control" MaxLength="50" runat="server" />
                    <!-- <input type="text" name="txtBookEmail1" value="email" class="form-control" /> -->
                    <br />
                    <asp:Label ID="Label15" Text="Phone" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="txtBookPhone" Text="phone" placeholder="enter your phone number" CssClass="form-control" MaxLength="25" runat="server" />
                    <!-- <input type="text" name="txtBookPhone1" value="phone" class="form-control" /> -->
                    <br />
                    <asp:Label ID="Label16" Text="Date" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="txtBookDate" Text="date" placeholder="enter your desired booking date" CssClass="form-control" MaxLength="25" runat="server" />
                    <!--<input type="text" name="txtBookDate1" value="date" class="form-control" />-->
                    <br />
                    <asp:Label ID="Label17" Text="Time" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="txtBookTime" placeholder="enter your desired booking time" Text="time" CssClass="form-control" MaxLength="25" runat="server" />
                    <!--<input type="text" name="txtBookTime1" value="time" class="form-control" />-->
                    <br />
                    <!--<input type="submit" value="Book Range1" class="btn btn-success" />-->
                    <asp:Button ID="btnBookSubmit" Text="Book Range" OnClick="bookingMailer" CssClass="btn btn-success" runat="server" /> 
               <!-- </form> -->
            </div>
            <div class="container1 col-sm-6 well">
                <div id="bookMap" class="container2 col-sm-6 well9" style="width:100%;height:370px;background-color:gray;">
                    Error: Google Maps API failed to load
                </div>
            </div>

            <div class="container1 col-sm-8 well equal-test1">
                <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                <asp:Label ID="Label19" Text="239 West River East Side Road, West River Station, NS, B0K 1Z0" CssClass="instructions" runat="server" />
            </div>
                <div class="container1 col-sm-4 well equal-test1" style="text-align:center;">
                    <br />
                    <asp:Label ID="Label20" Text="Copyright 2018 Staghorn Shooting Club" CssClass="instructions" runat="server" />
                    <br /><br />
                </div>
            </div>
        </div>
        <div id="linksPanel" class="container2 col-sm-12 well" style="display:none;" runat="server">
            <asp:Label ID="lblLinksTitle" Text="You can visit our facebook page by clicking " runat="server" />
            <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" style=" text-decoration:none; color:white; font-weight:bold"> here</a>
            <asp:Label ID="lblLinksTitle2" Text="or by clicking one of the facebook links in the page footer." runat="server" /><br />
            <br />
            <asp:Label ID="lbl" Text="You can download a copy of the clubs bylaws by clicking " runat="server" />
            <a href="C:\Users\itstudents\Desktop\StaghornSite v2\files\bylaws.pdf" style=" text-decoration:none; color:white; font-weight:bold"> here</a><br /><br />

            <asp:Label ID="Label5" Text="You can download a copy of the clubs ethics by clicking " runat="server" />
            <a href="C:\Users\itstudents\Desktop\StaghornSite v2\files\ethics.docx" style=" text-decoration:none; color:white; font-weight:bold"> here</a><br />

            <br /><br /><br /><br /><br />

            <div class="container1 col-sm-8 well equal-test1">
                <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                <asp:Label ID="Label6" Text="239 West River East Side Road, West River Station, NS, B0K 1Z0" CssClass="instructions" runat="server" />
            </div>
                <div class="container1 col-sm-4 well" style="text-align:center;">
                    <br />
                    <asp:Label ID="Label7" Text="Copyright 2018 Staghorn Shooting Club" CssClass="instructions" runat="server" />
                </div>
            </div>
        </div>
        <div id="contactPanel" class="container2 col-sm-12 well" style="display:none;" runat="server">
            <div class="container col-sm-8 ">
                <asp:Image class="img-rounded img-responsive" ID="Image1" ImageUrl="images/contactusnew.jpeg" Height="200px" Width="1200px" runat="server" AlternateText="contact us" />
                <br /><br /><br /><br />
            </div>
            <div class="container col-sm-4 ">
                <asp:ImageButton class="img-rounded img-responsive" OnClick="facebook" ID="imgFacebook2" ImageUrl="images/facebook.jpg" Height="90px" Width="610px" runat="server" AlternateText="facebook" />
      
                <asp:Image class="img-rounded img-responsive" ID="imgCourses3" ImageUrl="images/coursesplaceholder2.jpg" Height="200px" Width="610px" runat="server" AlternateText="courses" />
                <br />
            </div>
            <div id="coursesPanel3" class="container2 col-sm-12" style="display:none;" runat="server">
                <div class="container2 col-sm-8">

                </div>
                <div class="container1 col-sm-4 well">
                    <asp:Label ID="Label11" Text="These are the courses the club offers: " runat="server" /><br /><br />
                    <a href="https://novascotia.ca/natr/hunt/firearms.asp" style=" text-decoration:none; color:white; font-weight:bold">Canadian Firearms Safety Course</a><br />
                    <a href="http://www.safetyservicesns.ca/restricted-firearms-safety/" style=" text-decoration:none; color:white; font-weight:bold">Restricted Firearms Safety Course</a><br />
                    <a href="https://www.huntercourse.com/canada/novascotia/?gclid=EAIaIQobChMIro384d7a2gIVDP5kCh24-ww8EAEYASAAEgJ8o_D_BwE" style=" text-decoration:none; color:white; font-weight:bold">Hunting and Crossbow Safety Course</a><br />
                </div>
            </div>

            <div class="container1 col-sm-6 well">
                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">phone</i>
                <asp:Label ID="lblPhoneTitle" Text="Phone: (902) 331-0548" CssClass="instructions" runat="server" /><br />

                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                <asp:Label ID="lblAddressTitle" Text="Mailing Address: 239 West River East Side Road, West River Station, NS, B0K 1Z0" CssClass="instructions" runat="server" /><br />

                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">mail</i>
                <asp:Label ID="lblMsgTitle" Text="Send us a message below!" CssClass="instructions" runat="server" /><br /><br />
                
               <!-- <form action="mailto:mail@mail.com" method="post" enctype="text/plain"> -->
                    <asp:Label ID="lblContactName" Text="Full Name" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <input type="text" name="txtContactName" value="name" class="form-control" />
                    <!--<asp:TextBox ID="txtContactName" Text="Enter your name" CssClass="form-control" MaxLength="25" runat="server" Class="contact" />-->
                    <br />
                    <asp:Label ID="lblContactEmail" Text="Email" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <input type="text" name="txtContactEmail" value="email" class="form-control" />
                    <!--<asp:TextBox ID="txtContactEmail" Text="Enter your email" CssClass="form-control" MaxLength="25" runat="server" Class="contact" />-->
                    <br />
                    <asp:Label ID="lblContactMessage" Text="Message" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <input type="text" name="txtMessage" value="message" class="form-control" />
                    <!--<asp:TextBox ID="txtContactMessage" Text="Enter your message" CssClass="form-control" TextMode="Multiline" MaxLength="25" runat="server" Class="contact" />-->
                    <br />
                    <input type="submit" value="Submit" class="btn btn-success" />
                    <!--<asp:Button ID="btnContactSend" Text="Submit" CssClass="btn btn-success" runat="server" />-->
                    <asp:Label ID="lblContactWarning" Text="*Red outlines indicate required fields" CssClass="errorColor" Font-Size="XX-Small" runat="server" />
                    <br /><br /><br />
               <!-- </form> -->

                <!--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br /><br /><br />-->
            </div>
            <div class="container1 col-sm-6 well4">
                <div id="contactMap" style="width:100%;height:459px;background-color:gray;" class="container1 col-sm-12 well positioning">
                    Error: Google Map API cannot be loaded
                </div>
            </div>
            <!--<div class="container col-sm-6 well">
                3<br /><br /><br /><br /><br /><br /><br />
            </div>
            <div class="container col-sm-6 well">
                4<br /><br /><br /><br /><br /><br /><br />
            </div>-->
            
                <div class="container1 col-sm-8 well equal-test1">
                    <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                    <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                    <asp:Label ID="Label3" Text="239 West River East Side Road, West River Station, NS, B0K 1Z0" CssClass="instructions" runat="server" />
                </div>
                <div class="container1 col-sm-4 well" style="text-align:center;">
                    <br />
                    <asp:Label ID="lblCopyright2" Text="Copyright 2018 Staghorn Shooting Club" CssClass="instructions" runat="server" />
                </div>  
            
        </div>
        <div id="membershipPanel" class="container2 col-sm-12 well" style="display:none;" runat="server">
           
            <div class="container col-sm-8">
                <asp:Image class="img-rounded img-responsive" ID="Image2" ImageUrl="images/member.jpeg" Height="200px" Width="1200px" runat="server" AlternateText="become a member" />
                <br /><br /><br /><br />
            </div>
            <div class="container col-sm-4">
                <asp:ImageButton class="img-rounded img-responsive" OnClick="facebook" ID="Image3" ImageUrl="images/facebook.jpg" Height="90px" Width="610px" runat="server" AlternateText="facebook" />
      
                <asp:Image class="img-rounded img-responsive" ID="imgCourses4" ImageUrl="images/coursesplaceholder2.jpg" Height="200px" Width="610px" runat="server" AlternateText="courses" />
                <br />
            </div>

            <div id="coursesPanel4" class="container2 col-sm-12" style="display:none;" runat="server">
                <div class="container2 col-sm-8">

                </div>
                <div class="container1 col-sm-4 well">
                    <asp:Label ID="Label12" Text="These are the courses the club offers: " runat="server" /><br /><br />
                    <a href="https://novascotia.ca/natr/hunt/firearms.asp" style=" text-decoration:none; color:white; font-weight:bold">Canadian Firearms Safety Course</a><br />
                    <a href="http://www.safetyservicesns.ca/restricted-firearms-safety/" style=" text-decoration:none; color:white; font-weight:bold">Restricted Firearms Safety Course</a><br />
                    <a href="https://www.huntercourse.com/canada/novascotia/?gclid=EAIaIQobChMIro384d7a2gIVDP5kCh24-ww8EAEYASAAEgJ8o_D_BwE" style=" text-decoration:none; color:white; font-weight:bold">Hunting and Crossbow Safety Course</a><br />
                </div>
            </div>

            <div class="container1 col-sm-6 well">

            <div class="container1 col-sm-12 well">
                <asp:Label ID="lblRatesTitle" Text="Current Membership Rates:" Font-Size="Small" CssClass="instructions" ForeColor="white" runat="server" /><br />
                <asp:Label ID="lblRegularRate" Text="Regular Membership ($50)" Font-Size="Small" CssClass="instructions" ForeColor="white" runat="server" /><br />
                <asp:Label ID="lblSeniorRate" Text="Seniors (65+) Membership ($40)" Font-Size="Small" CssClass="instructions" ForeColor="white" runat="server" /><br />
            </div>

                <form method="post">
                    <!--<input type="text" name="os0" size="20" />-->
                    <asp:Label ID="lblName" Text="Name" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os0" Text=" Enter name" CssClass="form-control" MaxLength="25" runat="server" Class="input" />
                    <input type="hidden" name="on0" value="Name" />
                    <asp:RequiredFieldValidator ID="valName" ControlToValidate="os0" runat="server" CssClass="errorColor" Text="*Name is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblCivic" Text="Civic Address" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os1" Text="Enter address" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os1" size="20" />-->
                    <input type="hidden" name="on1" value="Civic Address" />
                    <asp:RequiredFieldValidator ID="valCivic" ControlToValidate="os1" runat="server" CssClass="errorColor" Text="*Your civic number is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />



                    <asp:Label ID="lblTown" Text="Town" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os2" Text="Enter town" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os2" size="20" />-->
                    <input type="hidden" name="on2" value="Town" />
                    <asp:RequiredFieldValidator ID="valTown" ControlToValidate="os2" runat="server" CssClass="errorColor" Text="*Town is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblPostal" Text="Postal Code" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os3" Text="B0K 1S0" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os3" size="20" />-->
                    <input type="hidden" name="on3" value="Postal Code" />
                    <asp:RequiredFieldValidator ID="valPostal" ControlToValidate="os3" runat="server" CssClass="errorColor" Text="*Your postal code is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br />
                    <!-- MUST take proper postal code with capital letters -->
                    <asp:RegularExpressionValidator ID="valPostal1" runat="server" ErrorMessage="*You must enter a valid postal code (V2X 7E7 format)" CssClass="errorColor" Font-Size="XX-Small" ControlToValidate="os3" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"></asp:RegularExpressionValidator><br />


                    <asp:Label ID="lblOccupation" Text="Occupation" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os4" Text="Enter occupation" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os4" size="20" />-->
                    <input type="hidden" name="on4" value="Occupation" />
                    <asp:RequiredFieldValidator ID="valOccupation" ControlToValidate="os4" runat="server" CssClass="errorColor" Text="*Occupation is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblPhone" Text="Phone Number" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os5" Text="902-555-5555" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os5" size="20" />-->
                    <input type="hidden" name="on5" value="Phone" />
                    <asp:RequiredFieldValidator ID="valPhone" ControlToValidate="os5" runat="server" CssClass="errorColor" Text="*Phone number is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="valPhone2" runat="server" ErrorMessage="*You must enter a valid phone number (902-555-5555 format)" CssClass="errorColor" Font-Size="XX-Small" ControlToValidate="os5" ValidationExpression="\D*([2-9]\d{2})(\D*)([2-9]\d{2})(\D*)(\d{4})\D*"></asp:RegularExpressionValidator><br />


                    <asp:Label ID="lblDob" Text="Date of Birth" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os6" Text="Enter dob" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os6" size="20" />-->
                    <input type="hidden" name="on6" value="DOB" />
                    <asp:RequiredFieldValidator ID="valDob" ControlToValidate="os6" runat="server" CssClass="errorColor" Text="*DOB is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblLicenseNumber" Text="Firearms License Number" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os7" Text="12345678.0001" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os7" size="20" />-->
                    <input type="hidden" name="on7" value="Firearms License Number" />
                    <asp:RequiredFieldValidator ID="valLicenseNumber" ControlToValidate="os7" runat="server" CssClass="errorColor" Text="*Your firearms license number is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ID="valLicenseNumber1" runat="server" ErrorMessage="*You must enter a valid firearms license number (12345678.0001 format)" CssClass="errorColor" Font-Size="XX-Small" ControlToValidate="os7" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][.][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator><br />


                    <asp:Label ID="lblExpiration" Text="Expiration Date" CssClass="label label-success" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os8" Text="Enter expiration date" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os8" size="20" />-->
                    <input type="hidden" name="on8" value="Exp Date" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="os8" runat="server" CssClass="errorColor" Text="*Your FLN expiration date is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br /> 

                    
                    <asp:Button ID="btnSubmit" Text="Order Membership" CssClass="btn btn-success" PostBackUrl="https://www.paypal.com/cgi-bin/webscr" runat="server" />

                    <input type="hidden" name="currency_code" value="CAD" />
                    <input type="hidden" name="charset" value="utf-8" />
                    <!-- TODO: Change this to the clients paypal email when the site is deployed -->
                    <input type="hidden" name="business" value="rhodes51166db@yahoo.ca" />
                    <input type="hidden" name="cmd" value="_xclick" />
                    <!-- Sets the description shown in paypal -->
                    <input type="hidden" name="item_name" value="Registration Fee: $50 Regular, $40 Seniors (65+)" />
                    <input type="hidden" name="item_number" value="1" />
                    <input type="hidden" name="tax_rate" value="0" />
                    <input type="hidden" name="tax" id="tax" value="0" />
                </form>
            </div>
            <div class="container2 col-sm-6 well10">
                <asp:Label ID="lblBenefits" Text="Benefits of Membership" Font-Size="Small" CssClass="instructions" runat="server" /><br />
                <div class="container1 col-sm-12 well whiteText">
                    These are the benefits of membership
                    <br /><br /><br /><br /><br /><br /><br /><br /><br />
                </div>
                <asp:Label ID="lblWhereBecomeMember" Text="Where to Become a Member" Font-Size="Small" CssClass="instructions" runat="server" /><br />
                <div class="container1 col-sm-12 well whiteText">
                    You can purchase a membership online, through this website or at the following retailers:<br /><br />
                    <li>Canadian Tire (New Glasgow)</li>
                    <li>Abercrombie Video</li>
                    <li>Woods and Water Westville</li>
                    <li>Terry's Pawn Shop (Truro)</li>
                    <br /><br />

                    The cost is $50 for a regular membership and $40 for seniors (65+)

                    <br />
                </div>

                <div class="container1 col-sm-12 well">
                    <div id="memberMap" style="width:100%;height:459px;background-color:gray;" class="container1 col-sm-12 well">
                        Error: Google Map API cannot be loaded
                    </div>
                </div>

                <!--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />-->

            </div>
            
                <div class="container1 col-sm-8 well equal-test1">
                    <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                    <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                    <asp:Label ID="Label2" Text="239 West River East Side Road, West River Station, NS, B0K 1ZO" CssClass="instructions" runat="server" />
                </div>
                <div class="container1 col-sm-4 well" style="text-align:center;">
                    <br />
                    <asp:Label ID="lblCopyright1" Text="Copyright 2018 Staghorn Shooting Club" CssClass="instructions" runat="server" />
                    
                </div>  
            
       </div>

        <div id="galleryPanel" class="container2 col-sm-12 well" style="display:none;" runat="server">
            <!-- Start Display Data -->
                    <!-- Repeater to display the images -->
                    <asp:repeater id="repDisplayImages" runat="server">
                    <HeaderTemplate>
                            <thead>
                             </thead>
                              <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>  
                                <div id="displayImages" class="container1 well12 col-sm-4" style="text-align:center; color:black;">
                                    <td>
                                        <asp:Label ID="lblImageTitle" Text='<%# Eval("title") %>' ForeColor="white" runat="server" /> <br />
                                    </td>
                                    <td>
                                        <img class="gallery" data-toggle="modal" data-target="#imageModal" src="http://localhost:57329/StaghornSite v2/siteImages/<%# Eval("image")%>" alt="image" height="100%" width="100%" /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblImageContent" Text='<%# Eval("caption") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <!--<p data-toggle="modal" data-target="#imageModal">Open Modal</p>-->
                                    </td>

                                    <td>

                                    </td>

                                    <div>
                                        <!-- Modal -->
                                    <!--
                                    <div class="modal fade" id="imageModal" role="dialog" style="display:none">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <span class="close">&times;</span>
                                                <h2><asp:Label ID="Label21" Text='<%# Eval("title") %>' ForeColor="white" runat="server" /></h2>
                                            </div>
                                            <div class="modal-body">
                                                <img class="modal-body" id="Img1" data-toggle="modal" data-target="#imageModal" src="http://localhost:57329/StaghornSite v2/siteImages/<%# Eval("image")%>" alt="image" height="150" width="150" />
                                            </div>
                                            <div class="modal-footer">
                                            <h3><asp:Label ID="Label22" Text='<%# Eval("caption") %>' ForeColor="white" runat="server" /></h3>
                                        </div>
                                    </div>
                                        -->
                                    <!-- Modal -->
                                    </div>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                             </tbody>
                        </FooterTemplate>
                      </asp:repeater>
                    <!-- Navigation -->
                    <div class="col-sm-12" style="text-align:center; color:black;">
                        <ul class="pager">
                            <li><asp:HyperLink ID="linkPrevImage" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server"><<</asp:HyperLink></li>
                            <li><asp:Label ID="lblPageInfoImage" ForeColor="white" BackColor="darkolivegreen" runat="server" /></li>
                            <li><asp:HyperLink ID="linkNextImage" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server">>></asp:HyperLink></li><br /><br />
                            <asp:Label ID="lblCurrentImage" Text="" ForeColor="darkseagreen" runat="server" />
                        </ul><br />
                    </div> 
                    <!-- End Display Data -->
            </div>
        </div>

        </div>
    </form>
</body>
</html>
