<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="setcut.aspx.cs" Inherits="setcut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<center><h2><b>Set Cut</b></h2></center>
<div class="w3-row">
<div class="w3-col s2 w3-mobile">&nbsp;</div>
<div class="w3-col s8 w3-padding w3-center w3-mobile w3-round-large w3-card-4" style="border-width:medium;border-color:Orange;border-style:double">
<div class="w3-row">
<center>
<asp:Label ID="lblmessage" runat="server" CssClass="w3-large" Font-Bold="true" Text=""></asp:Label>
</center>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
   <b style="font-size:large">IP No.</b> <br />
   <asp:Label ID="lblipno" runat="server" CssClass="w3-large w3-text-red" Font-Bold="true" Text=""></asp:Label>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile">
<b style="font-size:large">Name</b> <br />
   <asp:Label ID="lblpname" runat="server" CssClass="w3-large w3-text-red" Font-Bold="true" Text=""></asp:Label>
</div>
</div>
<div class="w3-row w3-center">
    <center><asp:RadioButtonList ID="rdcuttype" 
            CssClass="w3-xlarge w3-text-red w3-padding" AutoPostBack="true" 
            Font-Bold="true" RepeatDirection="Horizontal" runat="server" 
            onselectedindexchanged="rdcuttype_SelectedIndexChanged">
    <asp:ListItem Selected="True" Text="Partial Cut&nbsp;&nbsp;&nbsp;" Value="partial"></asp:ListItem>
    <asp:ListItem Text="Complete Cut" Value="complete"></asp:ListItem>
    </asp:RadioButtonList>
    </center>
</div>

<div class="w3-row">
<div class="w3-col s6 w3-padding w3-center w3-mobile" id="refferedcutcol" runat="server" visible="false">
    <asp:Label ID="lbl1" runat="server" CssClass="w3-large" Text="Reffered From"></asp:Label>
    <asp:DropDownList ID="ddrefferedfrom" CssClass="w3-input w3-center w3-sand" 
        runat="server" DataSourceID="SqlDataSource1" DataTextField="name" 
        DataValueField="sno">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:expensegeetanjaliConnectionString %>" 
        SelectCommand="SELECT * FROM [refferedpersons] ORDER BY [name]">
    </asp:SqlDataSource>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile" id="hospitalcutcol" runat="server" visible="false">
<asp:Label ID="Label1" runat="server" CssClass="w3-large" Text="Hospital Cut(%)"></asp:Label>
<asp:TextBox ID="txthospitalcut" CssClass="w3-input w3-sand" placeholder="Patient Hospital Cut %" runat="server"></asp:TextBox>
</div> 
<div class="w3-col s6 w3-padding w3-center w3-mobile" id="completecutcol" runat="server" visible="false">
<asp:Label ID="Label4" runat="server" CssClass="w3-large" Text="All Complete Cut(%)"></asp:Label>
<asp:TextBox ID="txtcompletecut" CssClass="w3-input w3-sand" placeholder="Patient Complete Cut %" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile" id="pathologycutcol" runat="server" visible="false">
<asp:Label ID="Label2" runat="server" CssClass="w3-large" Text="Pathology Cut(%)"></asp:Label>
<asp:TextBox ID="txtpathologycut" CssClass="w3-input w3-sand" placeholder="Patient Pathology Cut %" runat="server"></asp:TextBox>
</div>
<div class="w3-col s6 w3-padding w3-center w3-mobile" id="medicinecutcol" runat="server" visible="false">
<asp:Label ID="Label3" runat="server" CssClass="w3-large" Text="Medicine Cut(%)"></asp:Label>
<asp:TextBox ID="txtmedicinecut" CssClass="w3-input w3-sand" placeholder="Patient Medicine Cut %" runat="server"></asp:TextBox>
</div>
</div>
<div class="w3-row">
<center>
    <asp:Button ID="btsubmit" runat="server" Text="Set Cut" 
        CssClass="w3-button w3-amber w3-large w3-round-large w3-card-4" 
        onclick="btsubmit_Click" />
</center>
</div>
</div>
<div class="w3-col s2 w3-mobile">&nbsp;</div>
</div>
</asp:Content>

