using Cintensivos_Seminarios.Models;

namespace Cintensivos_Seminarios.Controllers
{
	public class Ccosto
	{
		public Mcosto mcosto = new Mcosto();

		public int codigo { get; set; }
		public int valorSalariosMinimos { get; set; }
		public int valorSalarioMinimo { get; set; }
		public int total { get; set; }
		public int individual { get; set; }
		public int pagoDocente { get; set; }
		public string fijo { get; set; }

		public Ccosto()
		{
		}

		public bool mergeCosto(Ccosto obj)
		{
			mcosto.codigo = obj.codigo;
			mcosto.valorSalariosMinimos = obj.valorSalariosMinimos;
			mcosto.valorSalarioMinimo = obj.valorSalarioMinimo;
			mcosto.total = obj.total;
			mcosto.individual = obj.individual;
			mcosto.pagoDocente = obj.pagoDocente;
			mcosto.fijo = obj.fijo;

			return mcosto.mergeCosto(mcosto);
		}

	}
}