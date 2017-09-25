using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["bazaSQL"].ConnectionString; 
        SqlConnection con = new SqlConnection(constr);

        SqlCommand com = new SqlCommand("CheckUser", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlParameter p1 = new SqlParameter("username", TextBox1.Text);
        SqlParameter p2 = new SqlParameter("password", TextBox2.Text);
        com.Parameters.Add(p1);
        com.Parameters.Add(p2);
        con.Open();
        SqlDataReader rd = com.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            Label1.Text = "Zalogowano pomyślnie.";
            Response.Redirect("Klient.aspx?UserName=" + TextBox1.Text);
            con.Close();
            
        }

        else if (TextBox1.Text.Equals("admin") && TextBox2.Text.Equals("admin1"))
        {
            con.Close();
            Label1.Text = "Zalogowano pomyślnie.";
            Response.Redirect("Default.aspx?UserName=" + TextBox1.Text);
        }
        else
        {
            con.Close();
            com = new SqlCommand("CheckUserP", con);
            com.CommandType = CommandType.StoredProcedure;
            p1 = new SqlParameter("username", TextBox1.Text);
            p2 = new SqlParameter("password", TextBox2.Text);
            com.Parameters.Add(p1);
            com.Parameters.Add(p2);
            con.Open();
            rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                Label1.Text = "Zalogowano pomyślnie.";
                Response.Redirect("Pracownik.aspx?UserName=" + TextBox1.Text);
            }
            else
            {
                Label1.Text = "Błędne hasło lub login.";
            }
        }
    }
}