<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageBooks.aspx.cs" Inherits="Online_Library_Management_System.ManageBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <style>
      .manage-books-container {
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #007bff;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s;
}

.form-control:focus {
    border-color: #007bff;
    outline: none;
}

.btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #0056b3;
}

.success-message {
    color: green;
    margin-top: 10px;
}

.books-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.books-table th, .books-table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}

.books-table th {
    background-color: #007bff;
    color: white;
}

.books-table td {
    background-color: #fff;
}

.books-table td .edit-btn,
.books-table td .delete-btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.books-table td .edit-btn:hover {
    background-color: #0056b3;
}

.books-table td .delete-btn {
    background-color: #dc3545;
}

.books-table td .delete-btn:hover {
    background-color: #c82333;
}

  </style>
 

    <div class="manage-books-container">
        <h2>Manage Books</h2>

        <div class="form-group">
            <label for="txtTitle">Title:</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txtAuthor">Author:</label>
            <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txtISBN">ISBN:</label>
            <asp:TextBox ID="txtISBN" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="txtPublishedDate">Published Date:</label>
            <asp:TextBox ID="txtPublishedDate" runat="server" CssClass="form-control" TextMode="Date" />
        </div>
        <div class="form-group">
            <label for="txtCopiesAvailable">Copies Available:</label>
            <asp:TextBox ID="txtCopiesAvailable" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="btnAddBook" runat="server" Text="Add Book" CssClass="btn" OnClick="btnAddBook_Click" />
        <asp:Button ID="btnUpdateBook" runat="server" Text="Update Book" CssClass="btn" OnClick="btnUpdateBook_Click" Visible="false" />
        <asp:Label ID="lblMessage" runat="server" CssClass="success-message" />
        
        <h3>Existing Books</h3>
        <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="False" CssClass="books-table">
            <Columns>
                <asp:BoundField HeaderText="Book ID" DataField="BookID" ReadOnly="True" />
                <asp:BoundField HeaderText="Title" DataField="Title" />
                <asp:BoundField HeaderText="Author" DataField="Author" />
                <asp:BoundField HeaderText="ISBN" DataField="ISBN" />
                <asp:BoundField HeaderText="Published Date" DataField="PublishedDate" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField HeaderText="Copies Available" DataField="CopiesAvailable" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("BookID") %>' OnClick="EditBook" CssClass="edit-btn" />
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("BookID") %>' OnClick="DeleteBook" CssClass="delete-btn" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
