using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace ADM_Test.Models
{
	public class Product
	{
		[XmlAttribute("id")]
		public string Id { get; set; }

		public string Title { get; set; }

		public string Description { get; set; }

		public string Image { get; set; }

		public double Price { get; set; }

		public string Availability { get; set; }

		[XmlArray]
		[XmlArrayItem(ElementName = "Spec")]
		public List<string> Specs { get; set; }
	}
}