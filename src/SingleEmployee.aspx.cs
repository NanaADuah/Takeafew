using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace _33705119_Assignment2
{
    public partial class SingleEmployee : System.Web.UI.Page
    {
        SqlConnection connection;
        string name;
        string surname;
        string email;
        string warehouse;
        string position;
        string workHours;
        string  ratings;
        string empID;
        public void loadCombo()
        {
            dlIDs.Items.Clear();
            Takeafew takeafew = new Takeafew();
            try
            {
                connection = new SqlConnection(takeafew.getSqlConn());
                connection.Open();

                SqlCommand command = new SqlCommand($"SELECT EmployeeID FROM Employees", connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read()) 
                {
                    dlIDs.Items.Add(reader.GetValue(0).ToString());
                }
                customInfo.Visible = true;
                lblConfirm.Text = "";
                btnConfirm.Visible = false;
                btnCancel.Visible = false;
                btnDismiss.Visible = true;

                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }
        private void LoadData(int ID) 
        {
            Takeafew takeafew = new Takeafew();

            customInfo.Visible = true;
            try
            {
                connection = new SqlConnection(takeafew.getSqlConn());
                connection.Open();

                SqlCommand command = new SqlCommand($"SELECT Name, Surname, Email, Position, Warehouse, Rating, Hours, EmployeeID FROM Employees WHERE EmployeeID = {ID}", connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    name = reader.GetString(0);
                    surname = reader.GetString(1);
                    email = reader.GetString(2);
                    position = reader.GetString(3);
                    warehouse = reader.GetString(4);
                    ratings = reader.GetValue(5).ToString();
                    workHours = reader.GetValue(6).ToString();
                }

                lblName.Text = $"{name} {surname} | ID: {ID}";
                lblPosition.Text = $"Current Position: {position}";
                lblEmail.Text = $"Email address: {email}";
                lblWarehouse.Text = $"Currently assigned to: {warehouse}";
                lblRating.Text = $"Current rating: {ratings}";
                lblWorkTime.Text = $"Current work hours per week: {workHours} hours";

                Random rand = new Random();
                int num = rand.Next(0, 20);
                if (num % 2 == 0)
                    imgProfile.ImageUrl = "~/Female.jpg";
                else
                    imgProfile.ImageUrl = "~/Male.jpg";
                
                connection.Close();
            }
            catch(SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["WorkerID"] == null)
                Response.Redirect("login.aspx");

            customInfo.Visible = false;

            btnConfirm.Visible = false;
            lblConfirm.Visible = false;
            btnCancel.Visible = false;
            lblEdit.Visible = false;
            lblConfirm.Text = "";
            btnDismiss.Visible = true;
            if(!Page.IsPostBack)
                loadCombo();
        }

        protected void btnHome_Click1(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeView.aspx");
        }

        protected void dlIDs_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData(int.Parse(dlIDs.SelectedItem.Value));
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            
            Takeafew takeafew = new Takeafew();
            string info = "";
            try
            {
                string query = $"DELETE FROM Employees WHERE EmployeeID = {int.Parse(dlIDs.SelectedValue.ToString())}";
                lblInfo.Text = takeafew.deleteValue(query);
                Response.Redirect("EmployeeView.aspx");
                
            }
            catch(SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        protected void btnDismiss_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(dlIDs.SelectedValue.ToString()))
            {
                btnDismiss.Visible = false;
                customInfo.Visible = true;
                btnConfirm.Visible = true;
                lblConfirm.Visible = true;
                btnCancel.Visible = true;
                lblInfo.Text = "";
                lblConfirm.Text = $"Are you sure you want to dismiss {name} {surname}? This cannot be undone.";
            }
            else
            {
                lblInfo.Text = "Select an employee from the droplist";
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            lblEdit.Visible = true;
            customInfo.Visible = false;
        }
    }
}