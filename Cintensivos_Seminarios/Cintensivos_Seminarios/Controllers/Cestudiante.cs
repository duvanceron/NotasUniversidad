using Cintensivos_Seminarios.Models;
using System.Data;

namespace Cintensivos_Seminarios.Controllers
{
	public class Cestudiante
	{
		public Mestudiante mestudiante;

		public Cestudiante()
		{
			mestudiante = new Mestudiante();
		}

		public DataTable consultarEstudiantes()
		{
			return mestudiante.ConsultarEstudiantes();
		}
	}
}