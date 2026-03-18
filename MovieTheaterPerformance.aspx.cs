using System;
using System.Web.UI;

namespace WebApplication1
{
    public partial class MovieTheaterPerformance : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Force the GridView to load with the first movie selected on initial page load.
                // This fixes the issue where navigating via the navbar gives an empty grid
                // because the DropDownList AutoPostBack hasn't fired yet.
                SqlDataSource2.SelectParameters["MovieID"].DefaultValue = DropDownList1.SelectedValue;
            }
        }
    }
}
