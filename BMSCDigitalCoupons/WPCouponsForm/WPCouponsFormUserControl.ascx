<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WPCouponsFormUserControl.ascx.cs" Inherits="BMSCDigitalCoupons.WPCouponsForm.WPCouponsFormUserControl" %>

<div class="simulator">
    <p>Consulta tus cupones canjeados</p>
    <p>
        <asp:DropDownList runat="server" ID="ddlTipoDocumento" CssClass="form" ToolTip="Tipo de documento">
            <asp:ListItem Selected="True" Text="CARNET DE IDENTIDAD" Value="1"></asp:ListItem>
            <asp:ListItem Text="OTRO DOCUMENTO" Value="2"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="rfvTipoDocumento" ControlToValidate="ddlTipoDocumento" ValidationGroup="Cupones"
            Display="Dynamic" ErrorMessage="Debe elegir un valor para este campo." InitialValue="0"
            SetFocusOnError="true" ForeColor="#95c11f"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox runat="server" ID="txbDocumento" CssClass="form" placeholder="(Documento de identidad)" MaxLength="20" ToolTip="Documento de identidad"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="rfvDocumento" ControlToValidate="txbDocumento" ValidationGroup="Cupones"
            Display="Dynamic" ErrorMessage="Debe ingresar un valor para este campo."
            SetFocusOnError="true" ForeColor="#95c11f"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:DropDownList runat="server" ID="ddlDepartamento" CssClass="form" ToolTip="Departamento expedido">
            <asp:ListItem Selected="True" Text="(Departamento expedido)" Value="0"></asp:ListItem>
            <asp:ListItem Text="BENI" Value="BE"></asp:ListItem>
            <asp:ListItem Text="COCHABAMBA" Value="CB"></asp:ListItem>
            <asp:ListItem Text="CHUQUISACA" Value="CH"></asp:ListItem>
            <asp:ListItem Text="LA PAZ" Value="LP"></asp:ListItem>
            <asp:ListItem Text="ORURO" Value="OR"></asp:ListItem>
            <asp:ListItem Text="PANDO" Value="PA"></asp:ListItem>
            <asp:ListItem Text="POTOSÍ" Value="PO"></asp:ListItem>
            <asp:ListItem Text="SANTA CRUZ" Value="SC"></asp:ListItem>
            <asp:ListItem Text="TARIJA" Value="TJ"></asp:ListItem>
            <asp:ListItem Text="OTRO" Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator runat="server" ID="rfvDepartamento" ControlToValidate="ddlDepartamento" ValidationGroup="Cupones"
            Display="Dynamic" ErrorMessage="Debe elegir un valor para este campo." InitialValue="0"
            SetFocusOnError="true" ForeColor="#95c11f"></asp:RequiredFieldValidator>
    </p>
    <p class="buttonarea">
        <asp:LinkButton runat="server" ID="lnkConfirm" OnClick="lnkConfirm_Click" Text="Consultar" ValidationGroup="Cupones"></asp:LinkButton>
    </p>
    
    <img src="/_catalogs/masterpage/bmsc/images/form_icon.png" alt="" />

    <asp:Literal runat="server" ID="ltrScriptLoader" Text=""></asp:Literal>
    <asp:Literal runat="server" ID="ltrMessage" Text=""></asp:Literal>
</div>