<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmAlumno.aspx.cs" Inherits="Intranet_frmAlumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Bienvenido:
        <asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
        <br />
        <br />
        <br />
        <asp:Button ID="btnReporte1" runat="server" Text="Notas Semestre" OnClick="btnReporte1_Click" />
        <asp:Button ID="btnReporte2" runat="server" Text="Notas Generales" OnClick="btnReporte2_Click" />
        <asp:Button ID="btnCambiarUsuario" runat="server" Text="Cambias Contraseña" OnClick="btnCambiarUsuario_Click" />
        <br />
        <asp:MultiView ActiveViewIndex="0" runat="server" ID="mvAlumno">
            <asp:View runat="server" ID="vReporte1">
                Reporte1
            </asp:View>
            <asp:View runat="server" ID="vReporte2">
                Reporte 2
            </asp:View>
            <asp:View runat="server" ID="vCambiarContraseña">
                Cambiar Contraseña <br />
                Contraseña Actual : <asp:TextBox runat="server" Id="txtContrasena"/> <br />
                De una nueva Contraseña : <asp:TextBox runat="server" Id="txtContrasenaNueva"/> <br />
                Repita Contraseña : <asp:TextBox runat="server" Id="txtRepitaContrasena"/> <br />
                <asp:Button Text="Cambiar contraseña" runat="server" ID="btnCambiarContrasena"/>
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
