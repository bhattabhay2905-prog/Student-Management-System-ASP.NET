using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class StudentList : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Students";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;

                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadStudents();
        }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadStudents();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string name = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            string email = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            string course = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

            string phone = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(cs))
            {

                string query = "UPDATE Students SET Name=@Name,Email=@Email,Course=@Course,Phone=@Phone WHERE Id=@Id";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Course", course);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

            GridView1.EditIndex = -1;

            LoadStudents();

            Response.Write("<script>alert('Student Updated Successfully')</script>");
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {

                string query = "DELETE FROM Students WHERE Id=@Id";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

            LoadStudents();

            Response.Write("<script>alert('Student Deleted Successfully')</script>");
        }

    }
}