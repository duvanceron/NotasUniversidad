using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mnota
	{
		private int nota_id { get; set; }
		private string nota_nombre { get; set; }
		private int nota_porcentaje { get; set; }
		public int grup_id { get; set; }

		private ConnectionOracle conn;
		private Parametro[] parameter;
		private Transaction[] trans;
		public Mnota()
		{
			conn = new ConnectionOracle();
		

		}

		public DataTable ConsultarPesosAcademicos(Mnota modelNota) {

			parameter = new Parametro[2];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("NEW_GRUPID", modelNota.grup_id, "NUMBER", ParameterDirection.Input);

			return conn.OraProcedimiento("FN_LISTARPESOSACADEMICOS", parameter);

		}

	}
}