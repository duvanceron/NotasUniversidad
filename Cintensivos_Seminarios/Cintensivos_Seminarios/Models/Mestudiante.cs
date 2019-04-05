using Cintensivos_Seminarios.BD;
using System.Data;
namespace Cintensivos_Seminarios.Models
{
	public class Mestudiante
	{
		private ConnectionOracle connect;
		private Parametro[] parameter;
		private Transaction[] trans;

		public Mestudiante()
		{
			connect = new ConnectionOracle();
		}

		public DataTable ConsultarEstudiantes()
		{
			return connect.realizarConsulta("PR_CONSULTARESTUDIANTES", "cursor1", null);
		}
	}
}