<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IssueBooks.aspx.cs" Inherits="Online_Library_Management_System.IssueBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="issue-books-container">
        <h2>Issue a Book</h2>
        <div class="form-group">
            <label for="ddlBooks">Select Book:</label>
            <asp:DropDownList ID="ddlBooks" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txtBorrowerName">Borrower's Name:</label>
            <asp:TextBox ID="txtBorrowerName" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="btnIssueBook" runat="server" Text="Issue Book" CssClass="btn" OnClick="btnIssueBook_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="success-message" />
        
        <h2>Currently Borrowed Books</h2>
        <asp:GridView ID="gvBorrowedBooks" runat="server" CssClass="table" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="BorrowID" HeaderText="Borrow ID" />
                <asp:BoundField DataField="BookTitle" HeaderText="Book Title" />
                <asp:BoundField DataField="BorrowerName" HeaderText="Borrower's Name" />
                <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:yyyy-MM-dd}" />
            </Columns>
        </asp:GridView>
    </div>

    <style>

    /* IssueBooks.css */
.issue-books-container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.issue-books-container h2 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn {
    background-color: #007bff;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

.btn:hover {
    background-color: #0056b3;
}

.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.table th, .table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}

.table th {
    background-color: #007bff;
    color: white;
}

.table tr:nth-child(even) {
    background-color: #f2f2f2;
}

.table tr:hover {
    background-color: #e0e0e0;
}


    </style>
</asp:Content>

