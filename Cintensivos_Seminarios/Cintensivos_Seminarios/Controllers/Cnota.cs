using Cintensivos_Seminarios.BD;
using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cnota
	{
		private Mnota modelNota;
		public int grup_id  {get;set;}

		public Cnota()
		{
			modelNota = new Mnota();
		}

		public DataTable ConsultarPesosAcademicos( Cnota controllerNota)
		{
			modelNota.grup_id = controllerNota.grup_id;

			return modelNota.ConsultarPesosAcademicos(modelNota); ;
		}
	}
}