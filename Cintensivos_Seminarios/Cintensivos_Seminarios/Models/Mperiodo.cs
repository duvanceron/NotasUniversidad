using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mperiodo
	{
		public int codigo { get; set; }
		public string nombre { get; set; }
		public int ano { get; set; }

		private ConnectionOracle conn = new ConnectionOracle();


		public DataTable ConsultarPeriodo()
		{

			return conn.realizarConsulta("PR_CONSULTARPERIODOS", "cursor1", null);
		}

	}
}