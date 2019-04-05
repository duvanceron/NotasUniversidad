using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cperiodo
	{
		public int codigo { get; set; }
		public string nombre { get; set; }
		public int ano { get; set; }

		public Mperiodo mperiodo = new Mperiodo();

		public Cperiodo()
		{

		}

		public DataTable ConsultarPeriodos()
		{
			return mperiodo.ConsultarPeriodo();
		}
	}
}