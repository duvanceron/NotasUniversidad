using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cdocente
	{
		public Mdocente mDocente;
		public int codigo;

		public Cdocente()
		{
			mDocente = new Mdocente();
		}

		public DataTable consultarDocentes()
		{
			return mDocente.ConsultarDocentes();
		}
	}
}