using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mproceso
	{
		public int codigo { get; set; }
		public string nombre { get; set; }
		private ConnectionOracle connect;
		private Parametro[] parameter;
		public Transaction[] trans;

		public Mproceso()
		{
			connect = new ConnectionOracle();
			parameter = new Parametro[2];
			trans = new Transaction[1];
		}

		public bool MergeProceso(Mproceso obj)
		{
			parameter[0] = new Parametro("NEWPROC_ID", obj.codigo);
			parameter[1] = new Parametro("NEWPROC_NOMBRE", obj.nombre);

			trans[0] = new Transaction("PR_MERGEPROCESOS", parameter);

			return connect.realizarTransaccion(trans);
		}

		public DataTable ConsultarProcesos()
		{
			return connect.realizarConsulta("PR_LISTARPROCESOS", "cursor1", null);
		}
	}
}