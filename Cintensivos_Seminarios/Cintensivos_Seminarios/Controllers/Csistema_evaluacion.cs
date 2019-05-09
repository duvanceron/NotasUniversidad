using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Csistema_evaluacion
	{

		public Msistema_evaluacion mSistema;
		public Csistema_evaluacion()
		{
			mSistema = new Msistema_evaluacion();
		}

		public DataTable ConsultarSistemasEvaluacion()
		{

			return mSistema.ConsultarSistemasEvaluacion();
		}
	}
}