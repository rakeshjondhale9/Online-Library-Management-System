<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Online_Library_Management_System.SignUp" %>

<style>
    body {
    background-color: #f4f4f4;
    font-family: Arial, sans-serif;
}

.signup-container {
    width: 300px;
    padding: 20px;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    margin: 100px auto;
    text-align: center;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    color: #555;
}

.form-control {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
    width: 100%;
    border-radius: 3px;
}

.btn:hover {
    background-color: #0056b3;
}

.error-message {
    color: red;
    margin-top: 10px;
}

</style>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="Styles/SignUp.css" />
</head>
<body>
    <div class="signup-container">
        <form id="form1" runat="server">
            <h2>Create a New Account</h2>
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn" OnClick="btnSignUp_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
            <div class="login-link">
                <a href="Login.aspx">Already have an account? Login</a>
            </div>
        </form>
    </div>
</body>
</html>