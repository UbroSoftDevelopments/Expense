<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Geetanjali Expense Management</title>
    <link rel="Stylesheet" href="CSS/StyleSheet.css" />
    <link rel="Stylesheet" href="CSS/ourstyle.css" />
    <link rel="Shortcut Icon" href="Resources/geetanjaliLogo.png" />
     <style>
    .at-menubutton{border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:inherit;background-color:inherit;text-align:center;cursor:pointer;white-space:nowrap}
    .at-menubutton:hover{color:#fff!important;background-color:#F86709!important}
    </style>
</head>
<body background="Resources/loginback.jpg" style="background-size:cover;background-repeat:no-repeat">
    <form id="form1" runat="server">
    <br /><br /><br /><br /><br />
    <div class="w3-row">
    <div class="w3-col s4">&nbsp;</div>
    <div class="w3-col s4 w3-center w3-round-large w3-card-4" style="background-color:rgba(96,125,139,0.2)"><br /><br />
    <asp:Label ID="lbl" runat="server" CssClass="w3-xlarge w3-text-white" Font-Underline="true" Font-Bold="true"> Login Here </asp:Label><br />
            <asp:Label ID="lblMsg" CssClass="w3-text-white" runat="server"></asp:Label>
            <br />
            <div class="w3-row">
                <div class="w3-col s2">&nbsp;</div>
                <div class="w3-col s8 w3-center">
                    <label class="w3-xlarge w3-text-white"><b>User ID</b></label>
                    <div class="w3-row w3-white w3-round-large w3-card-4">
                        <i class="fa w3-col w3-xlarge w3-padding s2 fa-user"></i>
                        <asp:TextBox CssClass="w3-col w3-round-large w3-padding s10 w3-border-0" AutoComplete="off" placeholder="Enter User ID" ID="txtUserId" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <label class="w3-xlarge w3-text-white"><b>Password</b></label>
                    <div class="w3-row w3-white w3-round-large w3-card-4">
                        <i class="fa w3-col w3-xlarge w3-padding s2 fa-lock"></i>
                        <asp:TextBox CssClass="w3-col w3-round-large w3-padding s10 w3-border-0" TextMode="Password" AutoComplete="off" placeholder="Enter Password" ID="txtPassword" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="w3-col s2">&nbsp;</div>
            </div>
            <br /><br />
            <asp:Button ID="btnLogin" runat="server" Font-Bold="true" 
            CssClass=" at-menubutton w3-btn w3-text-dark-gray w3-xlarge w3-white w3-round-large" 
            Text="Log In" onclick="btnLogin_Click" />
   <br /><br />
    </div>
    <div class="w3-col s4">&nbsp;</div>
    </div>
    </form>
</body>
</html>
