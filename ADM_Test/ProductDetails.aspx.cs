using ADM_Test.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace ADM_Test
{
	public partial class ProductDetails : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        public Product GetProduct([QueryString("id")] string id)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Store));
            Store store;
            using (StreamReader reader = new StreamReader(Server.MapPath(@"~/XmlData/Detail.xml")))
            {
                store = (Store)serializer.Deserialize(reader);
            }
            return store.Products.FirstOrDefault(x => x.Id == id);
        }
    }
}