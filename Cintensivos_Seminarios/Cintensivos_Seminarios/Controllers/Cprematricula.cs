using Cintensivos_Seminarios.BD;
using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cprematricula
	{
		private ConnectionOracle conn;
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


		public DataTable ConsultarPrematriculas(Cprematricula obj)
		{
			prematricula.fkgrupo = obj.fkgrupo;
			return prematricula.ConsultarPrematriculas(prematricula);
		}

	}
}