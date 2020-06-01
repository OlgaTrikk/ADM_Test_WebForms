using ADM_Test.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace ADM_Test
{
	public partial class Products : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

        public IQueryable<Product> GetProducts()
        {
			try
			{	// if product list was previously sorted, restore the sorting accordingly with the saved session state 
				if (Session["SortingType"] != null && Session["SortingDirection"] != null)
				{
					var type = Session["SortingType"].ToString();
					var direction = (SortDirection)Session["SortingDirection"];
					ProductList.Sort(type, direction);
					SortList.SelectedValue = type;
				}
			}
			catch (Exception)
			{
			}

            XmlSerializer serializer = new XmlSerializer(typeof(Store));
            Store store;
            using (StreamReader reader = new StreamReader(Server.MapPath(@"~/XmlData/List.xml")))
            {
                store = (Store)serializer.Deserialize(reader);
            }
            return store.Products.DistinctBy(x => x.Id).AsQueryable();
        }

        public void AscSortButton_Click(object sender, EventArgs e)
        {
			string expression = SortList.SelectedValue;
			if (!string.IsNullOrEmpty(expression))
			{
				ProductList.Sort(expression, SortDirection.Ascending);
				Session["SortingType"] = expression;
				Session["SortingDirection"] = SortDirection.Ascending;
			}		
		}

		protected void DescSortButton_Click(object sender, EventArgs e)
		{
			string expression = SortList.SelectedValue;
			if (!string.IsNullOrEmpty(expression))
			{
				ProductList.Sort(expression, SortDirection.Descending);
				Session["SortingType"] = expression;
				Session["SortingDirection"] = SortDirection.Descending;
			}
				
		}
	}
}