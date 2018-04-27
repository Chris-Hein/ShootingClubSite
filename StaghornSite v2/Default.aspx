<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">
    // Page load
    protected void page_load() {
        //
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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
            // Defaults button to disabled
            $submit.attr('disabled', true);
            // Sets the border of the input to boxes to red by default 
            $input.css("border", "1px solid red");
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
            page content -- contact
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
                    <input type="hidden" name="business" value="rhodes51166db@yahoo.ca" />
                    <input type="hidden" name="cmd" value="_xclick" />
                    <input type="hidden" name="item_name" value="Registration Fee: $50 Regular, $40 Seniors (65+)" />
                    <input type="hidden" name="item_number" value="1" />
                    <input type="hidden" name="tax_rate" value="0" />
                    <input type="hidden" name="tax" id="tax" value="0" />
                </form>
            </div>
            <div class="container col-sm-6 well">
                <asp:Label ID="Label1" Text="Benefits of Membership" Font-Size="Small" runat="server" /><br />
                <div class="container col-sm-12 well">
                    <br /><br /><br /><br /><br /><br /><br /><br /><br />
                </div>
                <asp:Label ID="Label2" Text="Where to Become a Member" Font-Size="Small" runat="server" /><br />
                <div class="container col-sm-12 well">
                    <br /><br /><br /><br /><br /><br /><br /><br /><br />
                </div>

                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

            </div>
            <div class="container col-sm-12 well">
            <a href="#" class="fa fa-facebook" style="font-size:40px; text-decoration:none;"></a>
            </div>
       </div>
    </form>
</body>
</html>
