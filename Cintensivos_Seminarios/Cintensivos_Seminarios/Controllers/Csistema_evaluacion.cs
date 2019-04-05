using Cintensivos_Seminarios.BD;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Csistema_evaluacion
	{
		private ConnectionOracle conn;
		private Parametro[] parameter;
		private Transaction[] trans;

		public Csistema_evaluacion()
		{
			conn = new ConnectionOracle();
		}

		public DataTable ConsultarSistemasEvaluacion() {
			parameter = new Parametro[1];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			return conn.OraProcedimiento("FN_CONSULTARSISTEMASEVALUACION", parameter);
		}
	}
}