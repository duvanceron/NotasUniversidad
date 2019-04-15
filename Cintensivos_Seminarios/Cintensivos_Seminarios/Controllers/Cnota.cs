using Cintensivos_Seminarios.BD;
using Cintensivos_Seminarios.Models;
using System.Collections.Generic;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cnota
	{
		private Mnota modelNota;
		public int nota_Id { get; set; }
		public string nota_Nombre { get; set; }
		public int nota_Porcentaje { get; set; }
		public int grup_Id  {get;set;}
		public int sise_Id;
		

		public Cnota()
		{
			modelNota = new Mnota();
		}

		public DataTable ConsultarPesosAcademicos( Cnota controllerNota)
		{
			modelNota.grup_id = controllerNota.grup_Id;

			return modelNota.ConsultarPesosAcademicos(modelNota); ;
		}


		public DataTable RemoveNoteGroup(List<Cnota> controllerNota)
		{
			

			return modelNota.ConsultarPesosAcademicos(modelNota); ;
		}
	}
}