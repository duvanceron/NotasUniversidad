using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Msistema_evaluacion
	{
		private int sise_id { get; set; }
		private string sise_nombre { get; set; }

		private ConnectionOracle conn;
		private Parametro[] parameter;

		public Msistema_evaluacion()
		{
			conn = new ConnectionOracle();
		}


		public DataTable ConsultarSistemasEvaluacion()
		{
			parameter = new Parametro[1];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			return conn.OraProcedimiento("FN_CONSULTARSISTEMASEVALUACION", parameter);
		}
	}
}