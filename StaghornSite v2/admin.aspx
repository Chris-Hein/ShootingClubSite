<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<!DOCTYPE html>

<script runat="server">
    protected void page_load() {
        checkLoginStatus();
    }

    protected void checkLoginStatus() {
        // Checks to ensure the user is actually logged into a valid account before permitting access to the main page
        if (Session["weblogin"] == null) {
            Response.Redirect("Default.aspx");
        } else if (((WebLogin)Session["weblogin"]).access != true) {
            Response.Redirect("Default.aspx");
        } else {
            lblUsername.Text = "You are logged in as " + Session["username"].ToString();
        }
    }

    protected void userLogout(Object src, EventArgs args) {
        Session.Remove("username");
        Session.Remove("weblogin");
        Response.Redirect("Default.aspx");
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staghorn Shooting Club - Admin</title>
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
</head>
<body>
    <form runat="server">
    <div class="container col-sm-12 well">
        <div class="container col-sm-4">
            <asp:Label ID="lblUsername" Text="" runat="server" />
        </div>
        <div class="container col-sm-4">
            
        </div>
        <div class="container col-sm-4" style="text-align:right;">
            <asp:Button ID="btnLogout" Text="Logout" CssClass="btn btn-success" OnClick="userLogout" Width="75px" runat="server" /><br /><br />
        </div>

        <div class="container col-sm-4 well">
            <br /><br />
        </div>

        <div class="container col-sm-4 well" style="text-align:center;">
            <asp:Button ID="btnNews" Text="News" CssClass="btn btn-success" Width="75px" runat="server" />
            <asp:Button ID="btnEvents" Text="Events" CssClass="btn btn-success" Width="75px" runat="server" />
            <asp:Button ID="btnAbout" Text="About" CssClass="btn btn-success" Width="75px" runat="server" />
        </div>

        <div class="container col-sm-4 well">
            <br /><br />
        </div>

        <!-- Events -->
        <div class="container col-sm-12 well">
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    add new event
                </div>

                <div class="container col-sm-12 well">
                    add new event here
                </div>  
            </div>
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    view existing events
                </div>

                <div class="container col-sm-12 well">
                    view existing events here
                </div>  
            </div>
        </div>

        <!-- News -->
        <div class="container col-sm-12 well">
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    add new news article
                </div>

                <div class="container col-sm-12 well">
                    add new news article here
                </div>  
            </div>
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    view existing news articles
                </div>

                <div class="container col-sm-12 well">
                    view existing news articles here
                </div>  
            </div>
        </div>

        <!-- About -->
        <div class="container col-sm-12 well">
            <br /><br /><br /><br /><br /><br />
        </div>
    </div>
    </form>
</body>
</html>
