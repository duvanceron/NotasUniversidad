using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mprematricula
	{
		private ConnectionOracle conn = new ConnectionOracle();
		private Transaction[] trans;
		private Parametro[] parameter;


		public int fkestudiante { get; set; }
		public int fkgrupo { get; set; }
		public float notaFinal { get; set; }
		public string estado { get; set; }

		public Mprematricula()
		{
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

	}
}