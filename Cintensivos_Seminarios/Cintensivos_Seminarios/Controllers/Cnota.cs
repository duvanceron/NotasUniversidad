using Cintensivos_Seminarios.BD;
using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cnota
	{
		private ConnectionOracle conn;
		private Parametro[] parameter;
		private Transaction[] trans;
		private Mnota modelNota;
		public int grup_id  {get;set;}
		public Cnota()
		{
			conn = new ConnectionOracle();
			modelNota = new Mnota();
		}

		public DataTable ConsultarPesosAcademicos( Cnota controllerNota)
		{
			modelNota.grup_id = controllerNota.grup_id;
			parameter = new Parametro[2];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("NEW_GRUPID", modelNota.grup_id, "NUMBER", ParameterDirection.Input);
			return conn.OraProcedimiento("FN_LISTARPESOSACADEMICOS", parameter);
		}
	}
}