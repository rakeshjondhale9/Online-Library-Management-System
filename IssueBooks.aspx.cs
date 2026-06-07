using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class IssueBooks : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
                LoadBorrowedBooks();
            }
        }

        private void LoadBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT BookID, Title FROM Books"; // Adjust as per your Books table
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlBooks.DataSource = reader;
                        ddlBooks.DataTextField = "Title"; // Assuming there's a Title field
                        ddlBooks.DataValueField = "BookID";
                        ddlBooks.DataBind();
                    }
                }
            }
        }

        private void LoadBorrowedBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        bb.BorrowID, 
                        b.Title AS BookTitle, 
                        bb.BorrowerName, 
                        bb.BorrowDate, 
                        bb.ReturnDate 
                    FROM 
                        BorrowedBooks bb
                    JOIN 
                        Books b ON bb.BookID = b.BookID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        gvBorrowedBooks.DataSource = reader;
                        gvBorrowedBooks.DataBind();
                    }
                }
            }
        }

        protected void btnIssueBook_Click(object sender, EventArgs e)
        {
            int bookID = Convert.ToInt32(ddlBooks.SelectedValue);
            string borrowerName = txtBorrowerName.Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO BorrowedBooks (BookID, BorrowerName) VALUES (@BookID, @BorrowerName)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BookID", bookID);
                    cmd.Parameters.AddWithValue("@BorrowerName", borrowerName);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Book issued successfully to " + borrowerName + ".";
            txtBorrowerName.Text = string.Empty; // Clear input field

            // Reload the borrowed books to reflect the new entry
            LoadBorrowedBooks();
        }
    }
}