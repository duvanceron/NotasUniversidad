using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mprematricula
	{
		private ConnectionOracle conn;
		private Transaction[] trans;
		private Parametro[] parameter;


		public int fkestudiante { get; set; }
		public int fkgrupo { get; set; }
		public float notaFinal { get; set; }
		public string estado { get; set; }

		public Mprematricula()
		{
			conn = new ConnectionOracle();
		}

		public bool mergePrematricula(Mprematricula obj)
		{
			parameter = new Parametro[4];
			parameter[0] = new Parametro("NEWIDESTUDIANTE", obj.fkestudiante);
			parameter[1] = new Parametro("NEWIDGRUPO", obj.fkgrupo);
			parameter[2] = new Parametro("NEWNOTAFINAL", obj.notaFinal);
			parameter[3] = new Parametro("NEWESTADO", obj.estado);

			trans = new Transaction[1];
			trans[0] = new Transaction("PR_MERGEPREMATRICULA", parameter);
			return conn.realizarTransaccion(trans);
		}

		public DataTable ConsultarPrematriculas(Mprematricula prematricula) {
			parameter = new Parametro[3];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("GRUPO", prematricula.fkgrupo, "NUMBER", ParameterDirection.Input);
			parameter[2] = new Parametro("DOCENTEID", 57425471, "NUMBER", ParameterDirection.Input);
			return conn.OraProcedimiento("FN_LISTARNOTAS", parameter);
		}

	}
}