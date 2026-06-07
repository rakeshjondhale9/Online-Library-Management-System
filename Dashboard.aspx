<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Online_Library_Management_System.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
 

        /* Dashboard.css */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 20px;
}

.dashboard-container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    border-radius: 8px;
    background-color: #ffffff;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.dashboard-container h2 {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
}

.statistics {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
}

.statistic {
    flex: 1;
    margin: 0 10px;
    padding: 20px;
    border-radius: 8px;
    background-color: #ffbc00;
    color: #fff;
    transition: transform 0.3s, box-shadow 0.3s;
    text-align: center;
}

.statistic:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.stat-header {
    font-size: 18px;
    margin-bottom: 10px;
}

.stat-value {
    font-size: 36px;
    font-weight: bold;
}

.activities-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #ffffff;
}

.activities-table th, .activities-table td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

.activities-table th {
    background-color: #007bff;
    color: white;
    font-weight: bold;
}

.activities-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.activities-table tr:hover {
    background-color: #e0e0e0;
}

.activities-table td {
    font-size: 14px;
    color: #555;
}

/* Responsive Design */
@media (max-width: 768px) {
    .statistics {
        flex-direction: column;
    }

    .statistic {
        margin-bottom: 20px;
    }
}


    </style>

    <div class="dashboard-container">
        <h2>Dashboard</h2>
        
        <div class="statistics">
            <div class="statistic">
                <h3>Total Books</h3>
                <asp:Label ID="lblTotalBooks" runat="server" CssClass="stat-value" />
            </div>
            <div class="statistic">
                <h3>Total Users</h3>
                <asp:Label ID="lblTotalUsers" runat="server" CssClass="stat-value" />
            </div>
            <div class="statistic">
                <h3>Books Issued</h3>
                <asp:Label ID="lblBooksIssued" runat="server" CssClass="stat-value" />
            </div>
            <div class="statistic">
                <h3>Books Returned</h3>
                <asp:Label ID="lblBooksReturned" runat="server" CssClass="stat-value" />
            </div>
        </div>

        <h2>Recent Activities</h2>
        <asp:GridView ID="gvRecentActivities" runat="server" AutoGenerateColumns="False" CssClass="activities-table">
            <Columns>
                <asp:BoundField DataField="Activity" HeaderText="Activity" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
