using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace ADM_Test.Dto
{
	[XmlType("Product")]
	public class ProductAvailabilityDto
	{
		[XmlAttribute("id")]
		public string Id { get; set; }

		public string Availability { get; set; }
	}
}