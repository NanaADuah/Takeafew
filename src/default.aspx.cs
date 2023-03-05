using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace _33705119_Assignment2
{
    public partial class _default1 : System.Web.UI.Page
    {
        SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            Takeafew takeafew = new Takeafew();
            string name = "";
            string email = "";
            string surname = "";
            if (Session["WorkerID"] != null)
            {
                try
                {
                    //display respective controls output
                    string query = $"SELECT Name, Email, Surname, Position FROM Users WHERE WorkerID = {Session["WorkerID"]}";
                    connection = new SqlConnection(takeafew.getSqlConn());
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);

                    SqlDataReader reader = command.ExecuteReader();

                    while(reader.Read())
                    {
                        name = reader.GetValue(0).ToString();
                        email = reader.GetValue(1).ToString();
                        surname = reader.GetValue(2).ToString();
                        Page.Title = "takeafew | " +reader.GetValue(3).ToString();
                    }

                    lblInfo.ForeColor = System.Drawing.Color.Black;
                    string output = name + " " + surname;
                    if(name.Equals(".X"))
                    {
                        output = "worker";
                    }

                    //display any help output
                    lblInfo.Text = $"Hello {output}, you can pick a task to oversee from below:";
                    lblIssues.Text = $"There are ({GenerateIssues()}) pending issues";
                    lblIssues.ForeColor = System.Drawing.ColorTranslator.FromHtml("#CF4800");
                    connection.Close();
    
            } catch(SqlException ex)
                {
                    lblInfo.Text = $"An error occured, {ex.Errors[0].Message}";
                    lblInfo.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
                Response.Redirect("login.aspx");
        }

        private int GenerateIssues()
        {
            return 0;
        }

        protected void lblLogout_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["takeafew"] != null)
            {
                HttpCookie loginDetails = Request.Cookies["takeafew"];
                loginDetails.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(loginDetails);
                Session.Abandon();
                Response.Redirect("login.aspx");
            } 
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void lblSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeView.aspx");
        }

        protected void btnWarehouse_Click(object sender, EventArgs e)
        {
            Response.Redirect("WarehouseView.aspx");
        }

        protected void btnStatistics_Click(object sender, EventArgs e)
        {
            Response.Redirect("Statistics.aspx");
        }

        protected void btnViewIssues_Click(object sender, EventArgs e)
        {
            Response.Redirect("Statistics.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("404.aspx");
        }

        protected void btnStock_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stock.aspx");
        }
    }
}