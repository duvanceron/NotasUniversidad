using Cintensivos_Seminarios.Models;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cintensidad_horaria
	{
		public Mintensidad_horaria intensidadHoraria = new Mintensidad_horaria();
		public int codigo { get; set; }
		public int presencial { get; set; }
		public int dirigido { get; set; }
		public int dependiente { get; set; }
		public int total { get; set; }

		public Cintensidad_horaria()
		{
		}

		public bool MergeIntensidadHoraria(Cintensidad_horaria obj)
		{
			intensidadHoraria.codigo = obj.codigo;
			intensidadHoraria.presencial = obj.presencial;
			intensidadHoraria.dirigido = obj.dirigido;
			intensidadHoraria.dependiente = obj.dependiente;
			intensidadHoraria.total = obj.total;

			return intensidadHoraria.MergeIntensidadHoraria(intensidadHoraria);
		}
	}
}