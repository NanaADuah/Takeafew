using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace _33705119_Assignment2
{
    public partial class WarehouseView : System.Web.UI.Page
    {
        SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            Takeafew takeafew = new Takeafew();
            if (Session["WorkerID"] == null)
                Response.Redirect("login.aspx");

            connection = new SqlConnection(takeafew.getSqlConn());
            displayData("SELECT * FROM Warehouse", "Warehouse");
            if(!Page.IsPostBack)
                loadCombo();
        }
        public void displayData(string query, string source)
        {
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dataSet = new DataSet();

                adapter.SelectCommand = command;
                adapter.Fill(dataSet, source);
                warehouseGrid.DataSource = dataSet;
                warehouseGrid.DataMember = source;
                warehouseGrid.DataBind();
                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        public void search(string query, string src)
        {
            SqlCommand command = new SqlCommand(query, connection);
            try
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;
                DataSet dataSet = new DataSet();

                adapter.Fill(dataSet, src);
                warehouseGrid.DataSource = dataSet;
                warehouseGrid.DataMember = src;
                warehouseGrid.DataBind();
                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].ToString()}";
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void warehouseGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblInfo.Text = warehouseGrid.SelectedValue.ToString();
        }

        public void loadCombo()
        {
            dlWarehouse.Items.Clear();
            Takeafew takeafew = new Takeafew();
            try
            {
                connection = new SqlConnection(takeafew.getSqlConn());
                connection.Open();

                SqlCommand command = new SqlCommand($"SELECT DISTINCT Name FROM Warehouse", connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    dlWarehouse.Items.Add(reader.GetValue(0).ToString());
                }
            

                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string query = $"SELECT Name, Surname, EmployeeID, Email FROM Employees WHERE Warehouse = '{dlWarehouse.SelectedItem.Value}'";
            displayItems(query);
        }

        public void displayItems(string query)
        {
            Takeafew takeafew = new Takeafew();
            lbPeople.Items.Clear();
            lbPeople.Items.Add(String.Format("{0}\t{1}\t{2}\t{3}","Name", "Surname", "ID","Email"));
            try 
            {
                connection = new SqlConnection(takeafew.getSqlConn());
                connection.Open();

                SqlCommand command= new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    lbPeople.Items.Add(String.Format("{0}\t{1}\t{2}\t{3}\n",reader.GetValue(0).ToString(), reader.GetValue(1).ToString(), reader.GetValue(2).ToString(), reader.GetValue(3).ToString()));
                    lbPeople.Items.Add("");
                }


                connection.Close();
            }
            catch (SqlException ex)
            {
                lblInfo.Text = $"An error occurred, {ex.Errors[0].Message}";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            displayData($"SELECT * FROM Warehouse WHERE Location LIKE '%{tbSearch.Text}%'", "Warehouse");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            displayData($"SELECT * FROM Warehouse", "Warehouse");

        }
    }
}