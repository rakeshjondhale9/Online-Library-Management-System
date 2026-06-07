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
    public partial class ManageBooks : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LibraryDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Books (Title, Author, ISBN, PublishedDate, CopiesAvailable) VALUES (@Title, @Author, @ISBN, @PublishedDate, @CopiesAvailable)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Author", txtAuthor.Text.Trim());
                    cmd.Parameters.AddWithValue("@ISBN", txtISBN.Text.Trim());
                    cmd.Parameters.AddWithValue("@PublishedDate", Convert.ToDateTime(txtPublishedDate.Text));
                    cmd.Parameters.AddWithValue("@CopiesAvailable", Convert.ToInt32(txtCopiesAvailable.Text));

                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Book added successfully.";
                }
            }

            LoadBooks();
            ClearInputs();
        }

        private void LoadBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Books";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvBooks.DataSource = dt;
                        gvBooks.DataBind();
                    }
                }
            }
        }

        protected void btnUpdateBook_Click(object sender, EventArgs e)
        {
            // Assuming BookID is stored in ViewState or hidden field
            if (ViewState["BookID"] != null)
            {
                int bookId = (int)ViewState["BookID"];
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Books SET Title=@Title, Author=@Author, ISBN=@ISBN, PublishedDate=@PublishedDate, CopiesAvailable=@CopiesAvailable WHERE BookID=@BookID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@Author", txtAuthor.Text.Trim());
                        cmd.Parameters.AddWithValue("@ISBN", txtISBN.Text.Trim());
                        cmd.Parameters.AddWithValue("@PublishedDate", Convert.ToDateTime(txtPublishedDate.Text));
                        cmd.Parameters.AddWithValue("@CopiesAvailable", Convert.ToInt32(txtCopiesAvailable.Text));
                        cmd.Parameters.AddWithValue("@BookID", bookId);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Book updated successfully.";
                    }
                }

                LoadBooks();
                ClearInputs();
                btnUpdateBook.Visible = false; // Hide update button after the update
            }
        }

        protected void EditBook(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Books WHERE BookID=@BookID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BookID", bookId);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtTitle.Text = reader["Title"].ToString();
                            txtAuthor.Text = reader["Author"].ToString();
                            txtISBN.Text = reader["ISBN"].ToString();
                            txtPublishedDate.Text = Convert.ToDateTime(reader["PublishedDate"]).ToString("yyyy-MM-dd");
                            txtCopiesAvailable.Text = reader["CopiesAvailable"].ToString();

                            // Store BookID in ViewState for update
                            ViewState["BookID"] = bookId;
                            btnUpdateBook.Visible = true; // Show update button
                        }
                    }
                }
            }
        }


        protected void DeleteBook(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Books WHERE BookID=@BookID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BookID", bookId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            LoadBooks();
        }

        private void ClearInputs()
        {
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtISBN.Text = "";
            txtPublishedDate.Text = "";
            txtCopiesAvailable.Text = "";
        }
    }
}