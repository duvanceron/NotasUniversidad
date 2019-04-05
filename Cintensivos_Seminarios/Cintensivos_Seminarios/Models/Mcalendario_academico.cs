using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mcalendario_academico
	{
		public string nombre { get; set; }
		public string codigo { get; set; }
		private ConnectionOracle conn;
		private Parametro[] parameter;
		public Transaction[] trans;

		public Mcalendario_academico()
		{
			conn = new ConnectionOracle();
			parameter = new Parametro[2];
			trans = new Transaction[1];
		}

		public bool MergeCalendarioAcademico(Mcalendario_academico obj)
		{
			parameter[0] = new Parametro("NEWCALE_CODIGO", obj.codigo);
			parameter[1] = new Parametro("NEWCALE_NOMBRE", obj.nombre);

			trans[0] = new Transaction("PR_MERGECALENDARIO", parameter);

			return conn.realizarTransaccion(trans);
		}

		public DataTable ConsultarCalendario()
		{

			return conn.realizarConsulta("PR_CONSULTARCALENDARIOS", "cursor1", null);
		}
	}
}