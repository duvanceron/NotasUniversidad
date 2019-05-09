using Cintensivos_Seminarios.Models;
using System.Data;

namespace Cintensivos_Seminarios.Controllers
{
	public class Cmodulo
	{
		Mmodulo modelModulo;
		Mgrupo modelGrupo;
		public Cmodulo()
		{
			modelModulo = new Mmodulo();
			modelGrupo = new Mgrupo();

		}

		public DataTable ConsultarModulos(Cgrupo ctrlGrupo)
		{
			modelGrupo.codigo = ctrlGrupo.codigo;

			return modelModulo.ConsultarModulos(modelGrupo);
		}
	}
}