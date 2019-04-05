using Cintensivos_Seminarios.Models;
using System.Data;

namespace Cintensivos_Seminarios.Controllers
{
	public class Ccurso
	{
		public Mcurso cursoModel;
		public int codigo { get; set; }
		public string nombre { get; set; }

		public Ccurso()
		{
			cursoModel = new Mcurso();
		}

		public bool MergeCurso(Ccurso obj)
		{
			cursoModel.codigo = obj.codigo;
			cursoModel.nombre = obj.nombre;
			return cursoModel.MergeCursos(cursoModel);
		}

		public DataTable consultarCursos()
		{
			return cursoModel.ConsultarCursos();
		}
	}
}