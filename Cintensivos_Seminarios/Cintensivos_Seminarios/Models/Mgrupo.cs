
using System.Data;
using Cintensivos_Seminarios.BD;
namespace Cintensivos_Seminarios.Models
{
	public class Mgrupo
	{

		private ConnectionOracle conn;
		private Parametro[] parameter;
		private Transaction[] trans;
		public int codigo { get; set; }
		public string nombre { get; set; }
		public int capacidad { get; set; }
		public string tema { get; set; }
		public string estado { get; set; }
		public string fkAsignatura { get; set; }
		public int fkCoste { get; set; }
		public int fkCurso { get; set; }
		public int fkDocente { get; set; }
		public int fkIntensidad { get; set; }
		public string fkCalendario { get; set; }
		public int fkPeriodo { get; set; }

		public Mgrupo()
		{
			conn = new ConnectionOracle();
			
			trans = new Transaction[1];
		}

		public bool MergeGrupo(Mgrupo obj)
		{
			parameter = new Parametro[12];
			parameter[0] = new Parametro("NEWCODIGO", obj.codigo);
			parameter[1] = new Parametro("NEWNOMBRE", obj.nombre);
			parameter[2] = new Parametro("NEWCAPACIDAD", obj.capacidad);
			parameter[3] = new Parametro("NEWTEMA", obj.tema);
			parameter[4] = new Parametro("NEWESTADO", obj.estado);
			parameter[5] = new Parametro("NEWFKASIGNATURA", obj.fkAsignatura);
			parameter[6] = new Parametro("NEWFKCOSTE", obj.fkCoste);
			parameter[7] = new Parametro("NEWFKCURSO", obj.fkCurso);
			parameter[8] = new Parametro("NEWFKDOCENTE", obj.fkDocente);
			parameter[9] = new Parametro("NEWFKINTENSIDAD", obj.fkIntensidad);
			parameter[10] = new Parametro("NEWFKCALENDARIO", obj.fkCalendario);
			parameter[11] = new Parametro("NEWFKPERIODO", obj.fkPeriodo);

			trans[0] = new Transaction("PR_MERGEGRUPO", parameter);

			return conn.realizarTransaccion(trans);
		}


	}
}