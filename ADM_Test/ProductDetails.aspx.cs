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
            Store storeDetail, storeList;
            using (StreamReader detailReader = new StreamReader(Server.MapPath(@"~/XmlData/Detail.xml")))
            using (StreamReader listReader = new StreamReader(Server.MapPath(@"~/XmlData/List.xml")))
            {
                storeDetail = (Store)serializer.Deserialize(detailReader);
                storeList = (Store)serializer.Deserialize(listReader);
            }
            var product = (from p1 in storeDetail.Products
                          join p2 in storeList.Products
                          on p1.Id equals p2.Id
                          where p1.Id == id
                          select new Product
                          {
                              Id = p1.Id,
                              Title = p1.Title,
                              Description = p1.Description,
                              Image = p1.Image,
                              Specs = p1.Specs,
                              Price = p2.Price
                          }).FirstOrDefault();

            return product;
        }
    }
}