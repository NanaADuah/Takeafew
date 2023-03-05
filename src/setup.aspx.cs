using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace _33705119_Assignment2
{
    public partial class setup : System.Web.UI.Page
    {
        SqlConnection connection;
        static string sqlConn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\takeafew.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

            lblErrors.Text = "";
            btnReSkip.Visible = false;

            //redirect back to login page
            if (Session["WorkerID"] == null)
                Response.Redirect("login.aspx");
        }

        protected void btnSkip_Click(object sender, EventArgs e)
        {
            btnReSkip.Visible = true;
            btnCancel.Visible = true;
            btnSkip.Visible = false;
        }

        protected void btnFinalize_Click(object sender, EventArgs e)
        {
            //redirect back to home page
            try
            {
                saveInformation();
            }
            finally
            {
                Response.Redirect("default.aspx");
            }
        }

        //Saving of the users information
        private void saveInformation()
        {
            if (!tbName.Text.Equals("") || !tbSurname.Text.Equals(""))
            {
                try
                {
                    connection = new SqlConnection(sqlConn);
                    connection.Open();
                    string query = $"UPDATE Users SET Name = '{tbName.Text}', Surname = '{tbSurname.Text}' WHERE WorkerID = {Session["WorkerID"]}";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.ExecuteNonQuery();

                    connection.Close();
                }
                catch (SqlException ex)
                {
                    lblErrors.Text = $"{ex.Errors[0].Message}";
                }
            }
            else
            { 
                //error handling
                lblErrors.Text = "Please fill in all inputs or skip.";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnReSkip.Visible = false;
            btnSkip.Visible = true; 

            btnCancel.Visible = false;
        }

        protected void btnReSkip_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}