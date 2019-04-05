using Cintensivos_Seminarios.BD;
using System.Data;
namespace Cintensivos_Seminarios.Models
{
	public class Mintensidad_horaria
	{

		private ConnectionOracle conn = new ConnectionOracle();
		private Parametro[] parameter;
		private Transaction[] trans;

		public int codigo { get; set; }
		public int presencial { get; set; }
		public int dirigido { get; set; }
		public int dependiente { get; set; }
		public int total { get; set; }

		public Mintensidad_horaria()
		{

		}

		public bool MergeIntensidadHoraria(Mintensidad_horaria obj)
		{
			parameter = new Parametro[5];
			parameter[0] = new Parametro("NEWCODIGO", obj.codigo);
			parameter[1] = new Parametro("NEWPRESENCIAL", obj.presencial);
			parameter[2] = new Parametro("NEWDIRIGIDO", obj.dirigido);
			parameter[3] = new Parametro("NEWDEPENDIENTE", obj.dependiente);
			parameter[4] = new Parametro("NEWTOTAL", obj.total);

			Transaction[] trans = new Transaction[1];
			trans[0] = new Transaction("PR_MERGEINTENSIDAD_HORARIA", parameter);

			return conn.realizarTransaccion(trans);

		}
	}
}