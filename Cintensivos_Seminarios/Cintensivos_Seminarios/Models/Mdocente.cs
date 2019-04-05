using Cintensivos_Seminarios.BD;
using System.Data;
namespace Cintensivos_Seminarios.Models
{
	public class Mdocente
	{
		private ConnectionOracle connect;
		private Parametro[] parameter;
		private Transaction[] trans;

		public int codigo { get; set; }


		public Mdocente()
		{
			connect = new ConnectionOracle();
			parameter = new Parametro[1];
			trans = new Transaction[1];
		}

		public DataTable ConsultarDocentes()
		{
			return connect.realizarConsulta("PR_CONSULTARDOCENTES", "cursor1", null);
		}

		public bool MergeDirector(Mdocente obj)
		{

			parameter[0] = new Parametro("NEWFKDOCENTE", obj.codigo);
			trans[0] = new Transaction("PR_MERGEDIRECTOR", parameter);
			return connect.realizarTransaccion(trans);
		}
	}
}