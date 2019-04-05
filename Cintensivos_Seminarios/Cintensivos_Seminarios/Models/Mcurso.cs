using Cintensivos_Seminarios.BD;
using System.Data;
namespace Cintensivos_Seminarios.Models
{
	public class Mcurso
	{
		private ConnectionOracle connect;
		private Parametro[] parameter;
		private Transaction[] trans;

		public int codigo { get; set; }
		public string nombre { get; set; }
		public string estado { get; set; }

		public Mcurso()
		{
			connect = new ConnectionOracle();
		}

		public bool MergeCursos(Mcurso obj)
		{
			parameter[0] = new Parametro("NEWCURS_CODIGO", obj.codigo);
			parameter[1] = new Parametro("NEWCURS_NOMBRE", obj.nombre);
			parameter[2] = new Parametro("NEWCURS_ESTADO", obj.estado);

			trans[0] = new Transaction("PR_MERGECURSO", parameter);
			return connect.realizarTransaccion(trans);
		}

		public DataTable ConsultarCursos()
		{
			parameter = new Parametro[1];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			return connect.OraProcedimiento("FN_LISTARCURSOS", parameter);
		}
	}
}