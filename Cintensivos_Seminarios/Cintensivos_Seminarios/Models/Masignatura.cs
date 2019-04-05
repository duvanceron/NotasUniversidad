using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Masignatura
	{
		private ConnectionOracle connect;
		private Parametro[] parameter;
		private Transaction[] trans;

		public int codigo { get; set; }
		public string nombre { get; set; }

		public Masignatura()
		{
			connect = new ConnectionOracle();
			parameter = new Parametro[2];
			trans = new Transaction[1];
		}

		/// <summary>
		/// Consulta las asignaturas existentes en la Universidad.
		/// </summary>
		/// <returns></returns>
		public DataTable ConsultarAsignaturas()
		{
			return connect.realizarConsulta("PR_CONSULTARASIGNATURAS", "cursor1", null);
		}
	}
}