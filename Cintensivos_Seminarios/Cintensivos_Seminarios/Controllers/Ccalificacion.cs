using Cintensivos_Seminarios.Models;

namespace Cintensivos_Seminarios.Controllers
{
	public class Ccalificacion
	{
		public int caliId { get; set; }
		public int notaId { get; set; }
		public double caliValor { get; set; }
		public int premId { get; set; }

		Mcalificacion modelCalificacion;

		public Ccalificacion()
		{
			modelCalificacion = new Mcalificacion();
		}

		public bool MergeNotaIndividual(Ccalificacion controllerCalificacion)
		{
			modelCalificacion.caliId = controllerCalificacion.caliId;
			modelCalificacion.notaId = controllerCalificacion.notaId;
			modelCalificacion.caliValor = controllerCalificacion.caliValor;
			modelCalificacion.premId = controllerCalificacion.premId;
			return modelCalificacion.MergeNotaIndividual(modelCalificacion);
		}

	}
}