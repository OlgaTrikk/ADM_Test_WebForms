using ADM_Test.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace ADM_Test.Dto
{
	[XmlRoot("Store")]
	public class StoreDto
	{
		public List<ProductAvailabilityDto> Products { get; set; }

	}
}