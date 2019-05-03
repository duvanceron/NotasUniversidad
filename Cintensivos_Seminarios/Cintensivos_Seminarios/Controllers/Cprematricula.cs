using Cintensivos_Seminarios.BD;
using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cprematricula
	{
		private ConnectionOracle conn ;
		private Transaction[] trans;
		private Parametro[] parameter;
		public Mprematricula prematricula;

		public int fkestudiante { get; set; }
		public int fkgrupo { get; set; }
		public float notaFinal { get; set; }
		public string estado { get; set; }

		public Cprematricula()
		{
			conn = new ConnectionOracle();
			prematricula = new Mprematricula();
		}

		public bool mergePrematricula(Cprematricula obj)
		{
			prematricula.fkestudiante = obj.fkestudiante;
			prematricula.fkgrupo = obj.fkgrupo;
			prematricula.notaFinal = obj.notaFinal;
			prematricula.estado = obj.estado;

			return prematricula.mergePrematricula(prematricula);
		}
		/*public DataTable ConsultarPrematriculas(Cprematricula obj)
		{
			prematricula.fkgrupo = obj.fkgrupo;
			prematricula.estado = obj.estado;
			parameter = new Parametro[2];
			parameter[0] = new Parametro("NEWFKGRUPO", prematricula.fkgrupo);
			parameter[1] = new Parametro("NEWESTADO", prematricula.estado);
			return conn.realizarConsulta("PR_CONSULTARPREMATRICULAS", "cursor1", parameter);

		}*/

		public DataTable ConsultarPrematriculas(Cprematricula obj)
		{
			prematricula.fkgrupo = obj.fkgrupo;
			parameter = new Parametro[3];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("GRUPO", prematricula.fkgrupo, "NUMBER", ParameterDirection.Input);
			parameter[2] = new Parametro("DOCENTEID", 57425471, "NUMBER", ParameterDirection.Input);
			return conn.OraProcedimiento("FN_LISTARNOTAS", parameter);
		}

	}
}