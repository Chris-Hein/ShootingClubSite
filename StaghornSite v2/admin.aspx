<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<!DOCTYPE html>

<script runat="server">
    // Admin object
    Admin admin;

    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataAdapter dbAdapter;
    DataSet dbDataSet;
    MySqlDataReader dbReader;
    string sqlString;


    protected void page_load() {
        admin = new Admin();
        
        if (!Page.IsPostBack) {
            // Populates the about us field with the existing info
            txtAboutUs.Text = Convert.ToString(admin.getAboutUsData());
            //
            displayNewsArticles();
            displayEvents();
        }
        
        checkLoginStatus();
    }

    protected void checkLoginStatus() {
        // Checks to ensure the user is actually logged into a valid account before permitting access to the admin page
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

    protected void selectEditNews(Object src, EventArgs args) {
        if (newsPanel.Style["display"] == "none") {
            newsPanel.Style.Add("display", "block");
            btnNews.CssClass = "btn btn-warning";
        } else {
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-success";
        }
    }

    protected void selectEditEvents(Object src, EventArgs args) {
        if (eventsPanel.Style["display"] == "none") {
            eventsPanel.Style.Add("display", "block");
            btnEvents.CssClass = "btn btn-warning";
        } else {
            eventsPanel.Style.Add("display", "none");
            btnEvents.CssClass = "btn btn-success";
        }
    }

    protected void selectEditAbout(Object src, EventArgs args) {
        if (aboutPanel.Style["display"] == "none") {
            aboutPanel.Style.Add("display", "block");
            btnAbout.CssClass = "btn btn-warning";
        } else {
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-success";
        }
    }

    // Handles updating of the about us info
    protected void updateAboutUs(Object src, EventArgs args) {
        // Checks for blank input
        if (txtAboutUs.Text == "") {
            lblEditError.Text = "Error: field must not be blank";
        } else {
            // Updates about us
            admin.updateAboutUs(Server.HtmlEncode(txtAboutUs.Text));
            // Then outputs a success message
            lblEditError.Text = "About Us has been successfully updated.";
        }
    }
    
    //
    protected void addNewsEntry(Object src, EventArgs args) {        
        
        if ((txtNewsTitle.Text == "") || (txtNewsContent.Text == "")) {
            lblNewsError.Text = "Error: Fields must not be blank";
        } else {
            // Generate todays date
            string date = DateTime.Now.ToShortDateString();
            // Create a new news entry
            admin.addNewsEntry(date, Server.HtmlEncode(txtNewsTitle.Text), Server.HtmlEncode(txtNewsContent.Text));
            // Output a success message
            lblNewsError.Text = "News article posted successfully";
        }
        
    }

    protected void addEventEntry(Object src, EventArgs args) {
        if ((txtEventName.Text == "") || (txtEventLocation.Text == "") || (txtEventDate.Text == "") || (txtEventDescription.Text == "")) {
            lblEventError.Text = "Error: All fields have to be filled out";
        } else {
            // Generate todays date
            string date = DateTime.Now.ToShortDateString();
            // Create a new event
            admin.addEventEntry(txtEventName.Text, txtEventLocation.Text, txtEventDate.Text, txtEventDescription.Text, date);
            // Output a success message
            lblEventError.Text = "New event created successfully";
        }
    }

    protected void displayNewsArticles() {
        dbConnection = new MySqlConnection("Database=staghorn;Data Source=localhost;User Id=root;Password=");
        sqlString = "SELECT * FROM news WHERE id > 0 ORDER BY id DESC";
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
        lblPageInfo.Text = "Article " + currentPage + " of " + pds.PageCount;

        if (!pds.IsFirstPage) {
            linkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage - 1);
        }

        if (!pds.IsLastPage) {
            linkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
        }
        // Binding the data to the repeater
        repDisplay.DataSource = pds;
        repDisplay.DataBind();
    }

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
        }

        if (!pds.IsLastPage) {
            linkNext1.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
        }
        // Binding the data to the repeater
        repDisplayEvents.DataSource = pds;
        repDisplayEvents.DataBind();
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
    
    <!-- site stylesheet -->
    <link rel="stylesheet" href="styles.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            // Toggles sliding the news panel open and closed
            $("#btnNews").click(function () {
                $("#newsPanel").slideToggle("fast");
            });

            // Toggles sliding the events panel open and closed
            $("#btnEvents").click(function () {
                $("#eventsPanel").slideToggle("fast");
            });

            // Toggles sliding the about panel open and closed
            $("#btnAbout").click(function () {
                $("#aboutPanel").slideToggle("fast");
            });

            //---------------------------------------------------------------

            // Sets the max length of the about us field to 500
            // Binds a keyup function to the comment text box
            $('#txtAboutUs').keyup(function () {
                var maxLength = 500;
                // Sets up a self referencing pointer to set the length to the current number of characters
                var length = $(this).val().length;
                // Subtracts a character from the count on every key up
                var length = maxLength - length;
                // Binds the function to the text property of lblEditError, so it can be called
                $('#lblAboutChars').text(length);
            });

            // Binds a keyup function to the news title text box
            $('#txtNewsTitle').keyup(function () {
                var maxLength = 100;
                // Sets up a self referencing pointer to set the length to the current number of characters
                var length = $(this).val().length;
                // Subtracts a character from the count on every key up
                var length = maxLength - length;
                // Binds the function to the text property of lblEditError, so it can be called
                $('#lblNewsTitleChars').text(length);
            });

            // Binds a keyup function to the news content text box
            $('#txtNewsContent').keyup(function () {
                var maxLength = 500;
                // Sets up a self referencing pointer to set the length to the current number of characters
                var length = $(this).val().length;
                // Subtracts a character from the count on every key up
                var length = maxLength - length;
                // Binds the function to the text property of lblEditError, so it can be called
                $('#lblNewsContentChars').text(length);
            });

            // Binds a keyup function to the event name text box
            $('#txtEventName').keyup(function () {
                var maxLength = 100;
                // Sets up a self referencing pointer to set the length to the current number of characters
                var length = $(this).val().length;
                // Subtracts a character from the count on every key up
                var length = maxLength - length;
                // Binds the function to the text property of lblEditError, so it can be called
                $('#lblEventNameChars').text(length);
            });

            // Binds a keyup function to the event location text box
            $('#txtEventLocation').keyup(function () {
                var maxLength = 100;
                // Sets up a self referencing pointer to set the length to the current number of characters
                var length = $(this).val().length;
                // Subtracts a character from the count on every key up
                var length = maxLength - length;
                // Binds the function to the text property of lblEditError, so it can be called
                $('#lblEventLocationChars').text(length);
            });

            // Binds a keyup function to the event date text box
            $('#txtEventDate').keyup(function () {
                var maxLength = 50;
                // Sets up a self referencing pointer to set the length to the current number of characters
                var length = $(this).val().length;
                // Subtracts a character from the count on every key up
                var length = maxLength - length;
                // Binds the function to the text property of lblEditError, so it can be called
                $('#lblEventDateChars').text(length);
            });

            // Binds a keyup function to the event date text box
            $('#txtEventDescription').keyup(function () {
                var maxLength = 500;
                // Sets up a self referencing pointer to set the length to the current number of characters
                var length = $(this).val().length;
                // Subtracts a character from the count on every key up
                var length = maxLength - length;
                // Binds the function to the text property of lblEditError, so it can be called
                $('#lblEventDescriptionChars').text(length);
            });

            //------------------------------------------------------------------

            $(function () {
                // Binds another keyup function to the about us field
                $('#txtAboutUs').keyup(function () {
                    // Sets the max length to 500
                    var maxLength = 500;
                    // Sets up a self referencing pointer to set the length to the current number of characters
                    var length = $(this).val().length;
                    // Checks to see if the current number of characters is greater than the max number (essentially testing to see if the current number is -1)
                    if (length > maxLength) {
                        // If it is, use a substring delimiter to cut the -1 off when appropriate and replace it with 0 to indicate there are no characters remaining
                        this.value = this.value.substring(0, maxLength);
                    }
                    // Lowers the charcount in the label by 1 with each keyup
                    $('#lblAboutChars').text(maxLength - length);
                });
            });

            $(function () {
                // Binds another keyup function to the news title field
                $('#txtNewsTitle').keyup(function () {
                    // Sets the max length to 100
                    var maxLength = 100;
                    // Sets up a self referencing pointer to set the length to the current number of characters
                    var length = $(this).val().length;
                    // Checks to see if the current number of characters is greater than the max number (essentially testing to see if the current number is -1)
                    if (length > maxLength) {
                        // If it is, use a substring delimiter to cut the -1 off when appropriate and replace it with 0 to indicate there are no characters remaining
                        this.value = this.value.substring(0, maxLength);
                    }
                    // Lowers the charcount in the label by 1 with each keyup
                    $('#lblNewsTitleChars').text(maxLength - length);
                });
            });

            $(function () {
                // Binds another keyup function to the news content field
                $('#txtNewsContent').keyup(function () {
                    // Sets the max length to 500
                    var maxLength = 500;
                    // Sets up a self referencing pointer to set the length to the current number of characters
                    var length = $(this).val().length;
                    // Checks to see if the current number of characters is greater than the max number (essentially testing to see if the current number is -1)
                    if (length > maxLength) {
                        // If it is, use a substring delimiter to cut the -1 off when appropriate and replace it with 0 to indicate there are no characters remaining
                        this.value = this.value.substring(0, maxLength);
                    }
                    // Lowers the charcount in the label by 1 with each keyup
                    $('#lblNewsContentChars').text(maxLength - length);
                });
            });

            $(function () {
                // Binds another keyup function to the event name field
                $('#txtEventName').keyup(function () {
                    // Sets the max length to 100
                    var maxLength = 100;
                    // Sets up a self referencing pointer to set the length to the current number of characters
                    var length = $(this).val().length;
                    // Checks to see if the current number of characters is greater than the max number (essentially testing to see if the current number is -1)
                    if (length > maxLength) {
                        // If it is, use a substring delimiter to cut the -1 off when appropriate and replace it with 0 to indicate there are no characters remaining
                        this.value = this.value.substring(0, maxLength);
                    }
                    // Lowers the charcount in the label by 1 with each keyup
                    $('#lblEventNameChars').text(maxLength - length);
                });
            });

            $(function () {
                // Binds another keyup function to the event location field
                $('#txtEventLocation').keyup(function () {
                    // Sets the max length to 100
                    var maxLength = 100;
                    // Sets up a self referencing pointer to set the length to the current number of characters
                    var length = $(this).val().length;
                    // Checks to see if the current number of characters is greater than the max number (essentially testing to see if the current number is -1)
                    if (length > maxLength) {
                        // If it is, use a substring delimiter to cut the -1 off when appropriate and replace it with 0 to indicate there are no characters remaining
                        this.value = this.value.substring(0, maxLength);
                    }
                    // Lowers the charcount in the label by 1 with each keyup
                    $('#lblEventLocationChars').text(maxLength - length);
                });
            });

            $(function () {
                // Binds another keyup function to the event date field
                $('#txtEventDate').keyup(function () {
                    // Sets the max length to 100
                    var maxLength = 100;
                    // Sets up a self referencing pointer to set the length to the current number of characters
                    var length = $(this).val().length;
                    // Checks to see if the current number of characters is greater than the max number (essentially testing to see if the current number is -1)
                    if (length > maxLength) {
                        // If it is, use a substring delimiter to cut the -1 off when appropriate and replace it with 0 to indicate there are no characters remaining
                        this.value = this.value.substring(0, maxLength);
                    }
                    // Lowers the charcount in the label by 1 with each keyup
                    $('#lblEventDateChars').text(maxLength - length);
                });
            });

            $(function () {
                // Binds another keyup function to the event name field
                $('#txtEventDescription').keyup(function () {
                    // Sets the max length to 100
                    var maxLength = 500;
                    // Sets up a self referencing pointer to set the length to the current number of characters
                    var length = $(this).val().length;
                    // Checks to see if the current number of characters is greater than the max number (essentially testing to see if the current number is -1)
                    if (length > maxLength) {
                        // If it is, use a substring delimiter to cut the -1 off when appropriate and replace it with 0 to indicate there are no characters remaining
                        this.value = this.value.substring(0, maxLength);
                    }
                    // Lowers the charcount in the label by 1 with each keyup
                    $('#lblEventDescriptionChars').text(maxLength - length);
                });
            });


        });
    </script>
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
            <asp:Button ID="btnNews" OnClientClick="return false" Text="News" CssClass="btn btn-success" Width="75px" runat="server" />
            <asp:Button ID="btnEvents" OnClientClick="return false" Text="Events" CssClass="btn btn-success" Width="75px" runat="server" />
            <asp:Button ID="btnAbout" OnClientClick="return false" Text="About" CssClass="btn btn-success" Width="75px" runat="server" />
        </div>

        <div class="container col-sm-4 well">
            <br /><br />
        </div>

        <!-- Events -->
        <div id="eventsPanel" class="container col-sm-12 well" style="display:none" runat="server">
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    add new event
                </div>

                <div class="container col-sm-12 well">
                    <asp:Label ID="lblEventName" Text="Event Name" CssClass="label label-success" Font-Size="XX-Small" runat="server" />
                    <asp:TextBox ID="txtEventName" Text="" CssClass="form-control" MaxLength="100" runat="server" />
                    <asp:Label ID="lblEventNameRemaining" Text="Remaining Characters: " Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <asp:Label ID="lblEventNameChars" Text="100" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <br />
                    <asp:Label ID="lblEventLocationTitle" Text="Event Location" CssClass="label label-success" Font-Size="XX-Small" runat="server" />
                    <asp:TextBox ID="txtEventLocation" Text="" CssClass="form-control" MaxLength="100" runat="server" />
                    <asp:Label ID="lblEventLocationRemaining" Text="Remaining Characters: " Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <asp:Label ID="lblEventLocationChars" Text="100" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <br />
                    <asp:Label ID="lblEventDateTitle" Text="Event Date" CssClass="label label-success" Font-Size="XX-Small" runat="server" />
                    <asp:TextBox ID="txtEventDate" Text="" CssClass="form-control" MaxLength="50" runat="server" />
                    <asp:Label ID="lblEventDateRemaining" Text="Remaining Characters: " Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <asp:Label ID="lblEventDateChars" Text="50" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <br />
                    <asp:Label ID="lblEventDescriptionTitle" Text="Event Description" CssClass="label label-success" Font-Size="XX-Small" runat="server" />
                    <asp:TextBox ID="txtEventDescription" TextMode="MultiLine" Text="" CssClass="form-control" MaxLength="500" Height="125px" runat="server" />

                    <asp:Label ID="lblEventDescriptionRemaining" Text="Remaining Characters: " Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <asp:Label ID="lblEventDescriptionChars" Text="500" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <br /><br />
                    <asp:Button ID="btnSubmitEvent" OnClick="addEventEntry" Text="Post Event" CssClass="btn btn-success" runat="server" />
                    <asp:Label ID="lblEventError" Text="" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                </div>  
            </div>
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    view existing events
                </div>

                <div class="container col-sm-12 ">
                    <!-- Start Display Data -->
                    <!-- Repeater to display the existing events -->
                    <asp:repeater id="repDisplayEvents" runat="server">
                    <HeaderTemplate>
                            <thead>
                             </thead>
                              <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>  
                                <div id="displayEvents" class="news well" style="text-align:center; padding:2px; color:black;">
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
                    <div class="col-sm-12" style="text-align:center; color:black;">
                        <ul class="pager">
                            <li><asp:HyperLink ID="linkPrev1" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server"><<</asp:HyperLink></li>
                            <li><asp:Label ID="lblPageInfo1" ForeColor="white" BackColor="darkolivegreen" runat="server" /></li>
                            <li><asp:HyperLink ID="linkNext1" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server">>></asp:HyperLink></li>
                        </ul><br />
                    </div> 
                    <!-- End Display Data -->
                </div>  
            </div>
        </div>

        <!-- News -->
        <div id="newsPanel" class="container col-sm-12 well" style="display:none;" runat="server">
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    add new news article
                </div>

                <div class="container col-sm-12 well">
                    <asp:Label ID="lblNewsTitle" Text="Article Title" CssClass="label label-success" Font-Size="XX-Small" runat="server" />
                    <asp:TextBox ID="txtNewsTitle" Text="" CssClass="form-control" MaxLength="100" runat="server" />
                    <asp:Label ID="lblNewsTitleCharsTitle" Text="Remaining Characters: " Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <asp:Label ID="lblNewsTitleChars" Text="100" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <br />
                    <asp:Label ID="lblNewsContent" Text="Article Content" CssClass="label label-success" Font-Size="XX-Small" runat="server" />
                    <asp:TextBox ID="txtNewsContent" TextMode="MultiLine" Text="" CssClass="form-control" MaxLength="500" Height="125px" runat="server" />

                    <asp:Label ID="lblNewsContentCharsTitle" Text="Remaining Characters: " Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <asp:Label ID="lblNewsContentChars" Text="500" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                    <br /><br />
                    <asp:Button ID="btnSubmitNews" Text="Post" CssClass="btn btn-success" OnClick="addNewsEntry" runat="server" />
                    <asp:Label ID="lblNewsError" Text="" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                </div>  
            </div>
            <div class="container col-sm-6 well">
                <div class="container col-sm-12 well" style="text-align:center;">
                    view existing news articles
                </div>

                <div class="container col-sm-12">
                    <!-- Start Display Data -->
                    <!-- Repeater to display the news articles -->
                    <asp:repeater id="repDisplay" runat="server">
                    <HeaderTemplate>
                            <thead>
                             </thead>
                              <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>  
                                <div id="displayNews" class="news well" style="text-align:center; padding:2px; color:black;">
                                    <td>
                                        <asp:Label ID="lblDate" Text='<%# Eval("date") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTitle" Text='<%# Eval("title") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblContent" Text='<%# Eval("content") %>' ForeColor="white" runat="server" /> <br /><br />
                                    </td>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                             </tbody>
                        </FooterTemplate>
                      </asp:repeater>
                    <!-- Navigation -->
                    <div class="col-sm-12" style="text-align:center; color:black;">
                        <ul class="pager">
                            <li><asp:HyperLink ID="linkPrev" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server"><<</asp:HyperLink></li>
                            <li><asp:Label ID="lblPageInfo" ForeColor="white" BackColor="darkolivegreen" runat="server" /></li>
                            <li><asp:HyperLink ID="linkNext" ForeColor="white" BackColor="darkolivegreen" Font-Bold="true" Font-Underline="false" OnClientClick="return false" runat="server">>></asp:HyperLink></li>
                        </ul><br />
                    </div> 
                    <!-- End Display Data -->
                </div>  
            </div>
        </div>

        <!-- About -->
        <div id="aboutPanel" class="container col-sm-12 well" style="display:none" runat="server">
            <div class="container col-sm-6 well">
                <asp:TextBox ID="txtAboutUs" TextMode="MultiLine" CssClass="form-control" MaxLength="200" Height="300px" runat="server" />
                
                <asp:Label ID="lblAboutCharsTitle" Text="Characters Remaining: " Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                <asp:Label ID="lblAboutChars" Text="500" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 
                <br /><br />
                <asp:Button ID="btnSubmitAbout" OnClick="updateAboutUs" Text="Edit" CssClass="btn btn-success" runat="server" />
                <asp:Label ID="lblEditError" Text="" Font-Size="XX-Small" CssClass="text text-danger" runat="server" /> 

                
            </div>
            <div class="container col-sm-6 well">
                edit about page info
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
