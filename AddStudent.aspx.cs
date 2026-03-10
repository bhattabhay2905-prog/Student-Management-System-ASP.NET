using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentManagementSystem
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Students(Name,Email,Course,Phone) VALUES(@Name,@Email,@Course,@Phone)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Course", txtCourse.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Response.Write("<script>alert('Student Added Successfully');window.location='StudentList.aspx';</script>");
        }
    }
}