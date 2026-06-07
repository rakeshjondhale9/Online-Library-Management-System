using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStatistics();
                LoadRecentActivities();
            }
        }

        private void LoadStatistics()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Total Books
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Books", con))
                {
                    lblTotalBooks.Text = cmd.ExecuteScalar().ToString();
                }

                // Total Users (excluding those who do not have a valid role)
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users", con))
                {
                    lblTotalUsers.Text = cmd.ExecuteScalar().ToString();
                }

                // Books Issued
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM BorrowedBooks WHERE ReturnDate IS NULL", con))
                {
                    lblBooksIssued.Text = cmd.ExecuteScalar().ToString();
                }

                // Books Returned
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM BorrowedBooks WHERE ReturnDate IS NOT NULL", con))
                {
                    lblBooksReturned.Text = cmd.ExecuteScalar().ToString();
                }
            }
        }

        private void LoadRecentActivities()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT Activity, Date 
                    FROM Activities 
                    ORDER BY Date DESC 
                    OFFSET 0 ROWS 
                    FETCH NEXT 10 ROWS ONLY"; // Limit to the most recent 10 activities

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    gvRecentActivities.DataSource = reader;
                    gvRecentActivities.DataBind();
                }
            }
        }
    }
}