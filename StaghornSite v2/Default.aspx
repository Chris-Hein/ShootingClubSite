<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<!DOCTYPE html>

<script runat="server">
    // Page load
    protected void page_load() {
        //
    }

    // Method to generate the body text of automated messages
    protected string messagetext() {
        string message;

        message = txtContactMessage.Text.ToString();

        return message;
    }

    // Method to handle sending messages to the club via the website contact us form
    // Note this is not set up to function properly yet, actual account data needs to 
    // be entered for the form to function
    protected void automatedMailer() {
        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage(txtContactName.Text.ToString(), "shootingclub@shootingclubemail.com", "Automated message from Staghorn Shooting Club Website", messagetext());
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred = new NetworkCredential("mail@hotmail.com", "password");
        SmtpClient smtpobj = new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }

    protected void selectHome(Object src, EventArgs args) {
        if (homePanel.Style["display"] == "none") {
            homePanel.Style.Add("display", "block");
            btnHome.CssClass = "btn btn-warning";
        } else {
            homePanel.Style.Add("display", "none");
            btnHome.CssClass = "btn btn-info";
        }
    }

    protected void selectNews(Object src, EventArgs args) {
        if (newsPanel.Style["display"] == "none") {
            newsPanel.Style.Add("display", "block");
            btnNews.CssClass = "btn btn-warning";
        } else {
            newsPanel.Style.Add("display", "none");
            btnNews.CssClass = "btn btn-info";
        }
    }

    protected void selectAbout(Object src, EventArgs args) {
        if (aboutPanel.Style["display"] == "none") {
            aboutPanel.Style.Add("display", "block");
            btnAbout.CssClass = "btn btn-warning";
        } else {
            aboutPanel.Style.Add("display", "none");
            btnAbout.CssClass = "btn btn-info";
        }
    }

    protected void selectCalendar(Object src, EventArgs args) {
        if (calendarPanel.Style["display"] == "none") {
            calendarPanel.Style.Add("display", "block");
            btnCalendar.CssClass = "btn btn-warning";
        } else {
            calendarPanel.Style.Add("display", "none");
            btnCalendar.CssClass = "btn btn-info";
        }
    }

    protected void selectLinks(Object src, EventArgs args) {
        if (linksPanel.Style["display"] == "none") {
            linksPanel.Style.Add("display", "block");
            btnLinks.CssClass = "btn btn-warning";
        } else {
            linksPanel.Style.Add("display", "none");
            btnLinks.CssClass = "btn btn-info";
        }
    }

    protected void selectContactUs(Object src, EventArgs args) {
        if (contactPanel.Style["display"] == "none") {
            contactPanel.Style.Add("display", "block");
            btnContact.CssClass = "btn btn-warning";
        } else {
            contactPanel.Style.Add("display", "none");
            btnContact.CssClass = "btn btn-info";
        }
    }

    protected void selectMembership(Object src, EventArgs args) {
        if (membershipPanel.Style["display"] == "none") {
            membershipPanel.Style.Add("display", "block");
            btnMembership.CssClass = "btn btn-warning";
        } else {
            membershipPanel.Style.Add("display", "none");
            btnMembership.CssClass = "btn btn-info";
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
                        $(this).css("border", "1px solid green");
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
            }

        });
    </script>
</head>
<body>
    <form runat="server">
    <div class="container col-sm-12 well">
        <div class="container col-sm-12 well">
            image
        </div>
        <div class="container col-sm-4 well">
            logged in as
        </div>
        <div class="container col-sm-4 well">
            page name
        </div>
        <div class="container col-sm-4 well">
            logout
        </div>
        <div class="container col-sm-12 well" style="text-align:center">
            <asp:Button ID="btnHome" Text="Home" CssClass="btn btn-info" Width="150px" OnClick="selectHome" runat="server" />
            <asp:Button ID="btnNews" Text="News"  CssClass="btn btn-info" Width="150px" OnClick="selectNews" runat="server" />
            <asp:Button ID="btnAbout" Text="About"  CssClass="btn btn-info" Width="150px" OnClick="selectAbout" runat="server" />
            <asp:Button ID="btnCalendar" Text="Calendar"  CssClass="btn btn-info" Width="150px" OnClick="selectCalendar" runat="server" />
            <asp:Button ID="btnLinks" Text="Links"  CssClass="btn btn-info" Width="150px" OnClick="selectLinks" runat="server" />
            <asp:Button ID="btnContact" Text="Contact Us"  CssClass="btn btn-info" Width="150px" OnClick="selectContactUs" runat="server" />
            <asp:Button ID="btnMembership" Text="Buy Membership"  CssClass="btn btn-info" Width="150px" OnClick="selectMembership" runat="server" />
        </div>
        <div id="homePanel" class="container col-sm-12 well" style="display:none;" runat="server">
            page content -- home
        </div>
        <div id="newsPanel" class="container col-sm-12 well" style="display:none;" runat="server">
            page content -- news
        </div>
        <div id="aboutPanel" class="container col-sm-12 well" style="display:none;" runat="server">
            page content -- about
        </div>
        <div id="calendarPanel" class="container col-sm-12 well" style="display:none;" runat="server">
            page content -- calendar
        </div>
        <div id="linksPanel" class="container col-sm-12 well" style="display:none;" runat="server">
            page content -- links
        </div>
        <div id="contactPanel" class="container col-sm-12 well" style="display:none;" runat="server">
            <div class="container col-sm-8 well">
                image for contact us
            </div>
            <div class="container col-sm-4 well">
                view courses
            </div>

            <div class="container col-sm-6 well">
                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">phone</i>
                <asp:Label ID="lblPhoneTitle" Text="Phone: (902) 331-0548" runat="server" /><br />

                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                <asp:Label ID="lblAddressTitle" Text="Address: 239 West River East Side Road, West River Station, NS, B0K 1Z0" runat="server" /><br />

                <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">mail</i>
                <asp:Label ID="lblMsgTitle" Text="Send us a message below!" runat="server" /><br /><br />

                <asp:Label ID="lblContactName" Text="Full Name" CssClass="label label-info" Font-Size="Small" runat="server" />
                <asp:TextBox ID="txtContactName" Text="Enter your name" CssClass="form-control" MaxLength="25" runat="server" Class="contact" />
                <br />
                <asp:Label ID="lblContactEmail" Text="Email" CssClass="label label-info" Font-Size="Small" runat="server" />
                <asp:TextBox ID="txtContactEmail" Text="Enter your email" CssClass="form-control" MaxLength="25" runat="server" Class="contact" />
                <br />
                <asp:Label ID="lblContactMessage" Text="Message" CssClass="label label-info" Font-Size="Small" runat="server" />
                <asp:TextBox ID="txtContactMessage" Text="Enter your message" CssClass="form-control" TextMode="Multiline" MaxLength="25" runat="server" Class="contact" />
                <br />
                <asp:Button ID="btnContactSend" Text="Submit" CssClass="btn btn-info" runat="server" />
                <asp:Label ID="lblContactWarning" Text="*Red outlines indicate required fields" CssClass="text text-danger" Font-Size="XX-Small" runat="server" />
                <br /><br /><br />
                <!--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br /><br /><br />-->
            </div>
            <div class="container col-sm-6 well">
                <div id="contactMap" style="width:100%;height:459px;background-color:gray;" class="container col-sm-12 well">
                    Error: Google Map API cannot be loaded
                </div>
            </div>
            <div class="container col-sm-6 well">
                3<br /><br /><br /><br /><br /><br /><br />
            </div>
            <div class="container col-sm-6 well">
                4<br /><br /><br /><br /><br /><br /><br />
            </div>
            
                <div class="container col-sm-8 well">
                    <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                    <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                    <asp:Label ID="Label3" Text="239 West River East Side Road, West River Station, NS, B0K 1Z0" runat="server" />
                </div>
                <div class="container col-sm-4 well" style="text-align:center;">
                    <br />
                    <asp:Label ID="lblCopyright2" Text="Copyright 2018 Staghorn Shooting Club" runat="server" />
                </div>  
            
        </div>
        <div id="membershipPanel" class="container col-sm-12 well" style="display:none;" runat="server">
           
            <div class="container col-sm-8 well">
                image for become a member
            </div>
            <div class="container col-sm-4 well">
                view courses
            </div>

            <div class="container col-sm-6 well">

            <div class="container col-sm-12 well">
                <asp:Label ID="lblRatesTitle" Text="Current Membership Rates:" Font-Size="Small" runat="server" /><br />
                <asp:Label ID="lblRegularRate" Text="Regular Membership ($50)" Font-Size="Small" runat="server" /><br />
                <asp:Label ID="lblSeniorRate" Text="Seniors Membership ($40)" Font-Size="Small" runat="server" /><br />
            </div>

                <form method="post">
                    <!--<input type="text" name="os0" size="20" />-->
                    <asp:Label ID="lblName" Text="Name" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os0" Text="" CssClass="form-control" MaxLength="25" runat="server" Class="input" />
                    <input type="hidden" name="on0" value="Name" />
                    <asp:RequiredFieldValidator ID="valName" ControlToValidate="os0" runat="server" CssClass="text text-danger" Text="*Name is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblCivic" Text="Civic Address" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os1" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os1" size="20" />-->
                    <input type="hidden" name="on1" value="Civic Address" />
                    <asp:RequiredFieldValidator ID="valCivic" ControlToValidate="os1" runat="server" CssClass="text text-danger" Text="*Your civic number is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />



                    <asp:Label ID="lblTown" Text="Town" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os2" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os2" size="20" />-->
                    <input type="hidden" name="on2" value="Town" />
                    <asp:RequiredFieldValidator ID="valTown" ControlToValidate="os2" runat="server" CssClass="text text-danger" Text="*Town is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblPostal" Text="Postal Code" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os3" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os3" size="20" />-->
                    <input type="hidden" name="on3" value="Postal Code" />
                    <asp:RequiredFieldValidator ID="valPostal" ControlToValidate="os3" runat="server" CssClass="text text-danger" Text="*Your postal code is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br />
                    <!-- MUST take proper postal code with capital letters -->
                    <asp:RegularExpressionValidator ID="valPostal1" runat="server" ErrorMessage="*You must enter a valid postal code (V2X 7E7 format)" CssClass="text text-danger" Font-Size="XX-Small" ControlToValidate="os3" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"></asp:RegularExpressionValidator><br />


                    <asp:Label ID="lblOccupation" Text="Occupation" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os4" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os4" size="20" />-->
                    <input type="hidden" name="on4" value="Occupation" />
                    <asp:RequiredFieldValidator ID="valOccupation" ControlToValidate="os4" runat="server" CssClass="text text-danger" Text="*Occupation is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblPhone" Text="Phone Number" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os5" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os5" size="20" />-->
                    <input type="hidden" name="on5" value="Phone" />
                    <asp:RequiredFieldValidator ID="valPhone" ControlToValidate="os5" runat="server" CssClass="text text-danger" Text="*Phone number is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="valPhone2" runat="server" ErrorMessage="*You must enter a valid phone number (902-555-5555 format)" CssClass="text text-danger" Font-Size="XX-Small" ControlToValidate="os5" ValidationExpression="\D*([2-9]\d{2})(\D*)([2-9]\d{2})(\D*)(\d{4})\D*"></asp:RegularExpressionValidator><br />


                    <asp:Label ID="lblDob" Text="Date of Birth" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os6" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os6" size="20" />-->
                    <input type="hidden" name="on6" value="DOB" />
                    <asp:RequiredFieldValidator ID="valDob" ControlToValidate="os6" runat="server" CssClass="text text-danger" Text="*DOB is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br />

                    
                    <asp:Label ID="lblLicenseNumber" Text="Firearms License Number" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os7" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os7" size="20" />-->
                    <input type="hidden" name="on7" value="Firearms License Number" />
                    <asp:RequiredFieldValidator ID="valLicenseNumber" ControlToValidate="os7" runat="server" CssClass="text text-danger" Text="*Your firearms license number is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /> 
                    <asp:RegularExpressionValidator ID="valLicenseNumber1" runat="server" ErrorMessage="*You must enter a valid firearms license number (12345678.0001 format)" CssClass="text text-danger" Font-Size="XX-Small" ControlToValidate="os7" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][.][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator><br />


                    <asp:Label ID="lblExpiration" Text="Expiration Date" CssClass="label label-info" Font-Size="Small" runat="server" />
                    <asp:TextBox ID="os8" Text="" CssClass="form-control" runat="server" Class="input" />
                    <!--<input type="text" class="inputTextBox" name="os8" size="20" />-->
                    <input type="hidden" name="on8" value="Exp Date" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="os8" runat="server" CssClass="text text-danger" Text="*Your FLN expiration date is a required field" Font-Size="XX-Small"></asp:RequiredFieldValidator><br /><br /> 

                    
                    <asp:Button ID="btnSubmit" Text="Order Membership" CssClass="btn btn-info" PostBackUrl="https://www.paypal.com/cgi-bin/webscr" runat="server" />

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
            <div class="container col-sm-6 well">
                <asp:Label ID="lblBenefits" Text="Benefits of Membership" Font-Size="Small" runat="server" /><br />
                <div class="container col-sm-12 well">
                    <br /><br /><br /><br /><br /><br /><br /><br /><br />
                </div>
                <asp:Label ID="lblWhereBecomeMember" Text="Where to Become a Member" Font-Size="Small" runat="server" /><br />
                <div class="container col-sm-12 well">
                    <br /><br /><br /><br /><br /><br /><br /><br /><br />
                </div>

                <div id="memberMap" style="width:100%;height:459px;background-color:gray;" class="container col-sm-12 well">
                    Error: Google Map API cannot be loaded
                </div>

                <!--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />-->

            </div>
            
                <div class="container col-sm-8 well">
                    <a href="https://www.facebook.com/Staghorn-Shooting-Club-143762139756474/" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
                    <i class="material-icons" style="font-size:40px;color:black;margin-right:10px;">place</i>
                    <asp:Label ID="Label2" Text="239 West River East Side Road, West River Station, NS, B0K 1ZO" runat="server" />
                </div>
                <div class="container col-sm-4 well" style="text-align:center;">
                    <br />
                    <asp:Label ID="lblCopyright1" Text="Copyright 2018 Staghorn Shooting Club" runat="server" />
                </div>  
            
       </div>
        </div>
    </form>
</body>
</html>
