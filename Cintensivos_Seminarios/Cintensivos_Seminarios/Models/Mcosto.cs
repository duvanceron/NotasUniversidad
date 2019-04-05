using Cintensivos_Seminarios.BD;

namespace Cintensivos_Seminarios.Models
{
	public class Mcosto
	{
		private ConnectionOracle conn = new ConnectionOracle();
		private Parametro[] parameter;
		private Transaction[] trans;

		public int codigo { get; set; }
		public int valorSalariosMinimos { get; set; }
		public int valorSalarioMinimo { get; set; }
		public int total { get; set; }
		public int individual { get; set; }
		public int pagoDocente { get; set; }
		public string fijo { get; set; }

		public Mcosto()
		{
		}

		public bool mergeCosto(Mcosto obj)
		{
			parameter = new Parametro[7];
			parameter[0] = new Parametro("NEWCODIGO", obj.codigo);
			parameter[1] = new Parametro("NEWSALARIOS", obj.valorSalariosMinimos);
			parameter[2] = new Parametro("NEWSALARIO", obj.valorSalarioMinimo);
			parameter[3] = new Parametro("NEWTOTAL", obj.total);
			parameter[4] = new Parametro("NEWINDIVIDUAL", obj.individual);
			parameter[5] = new Parametro("NEWPAGODOCENTE", obj.pagoDocente);
			parameter[6] = new Parametro("NEWFIJO", obj.fijo);

			Transaction[] trans = new Transaction[1];
			trans[0] = new Transaction("PR_MERGECOSTO", parameter);
			return conn.realizarTransaccion(trans);
		}
	}
}