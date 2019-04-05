using Cintensivos_Seminarios.BD;
using Cintensivos_Seminarios.Models;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cgrupo
	{

		private ConnectionOracle conn;
		private Parametro[] parameter;
		private Transaction[] trans;
		public Mgrupo grupo;
		public Mdocente docente;
		public int codigo { get; set; }
		public string nombre { get; set; }
		public int capacidad { get; set; }
		public string tema { get; set; }
		public string estado { get; set; }
		public string fkAsignatura { get; set; }
		public int fkCoste { get; set; }
		public int fkCurso { get; set; }
		public int fkIntensidad { get; set; }
		public string fkCalendario { get; set; }
		public int fkPeriodo { get; set; }



		public Cgrupo()
		{
			conn = new ConnectionOracle();
			trans = new Transaction[1];
			grupo = new Mgrupo();
			docente = new Mdocente();
		}

		public bool MergeGrupo(Cgrupo obj)
		{
			grupo.codigo = obj.codigo;
			grupo.nombre = obj.nombre;
			grupo.capacidad = obj.capacidad;
			grupo.tema = obj.tema;
			grupo.estado = obj.estado;
			grupo.fkAsignatura = obj.fkAsignatura;
			grupo.fkCoste = obj.fkCoste;
			grupo.fkCurso = obj.fkCurso;
			grupo.fkIntensidad = obj.fkIntensidad;
			grupo.fkCalendario = obj.fkCalendario;
			grupo.fkPeriodo = obj.fkPeriodo;
			return grupo.MergeGrupo(grupo);
		}

		
		/*public DataTable ConsultarGrupos()
		{
			return conn.realizarConsulta("PR_CONSULTARGRUPOS", "cursor1", null);
		}*/


		public DataTable ConsultarGrupos(Cgrupo obj, Cdocente objDocente)
		{
			grupo.fkCurso = obj.fkCurso;
			docente.codigo = objDocente.codigo;
			parameter = new Parametro[3];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("NEW_TIPOCURSO", grupo.fkCurso, "NUMBER", ParameterDirection.Input);
			parameter[2] = new Parametro("NEW_DOCENTE", docente.codigo, "NUMBER", ParameterDirection.Input);
			return conn.OraProcedimiento("FN_CONSULTARGRUPOS",parameter);
		}
		public DataTable ListarSeminarios(Cgrupo obj,Cdocente objDocente)
		{
			grupo.fkCurso = obj.fkCurso;
			docente.codigo = objDocente.codigo;
			parameter = new Parametro[3];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("NEW_TIPOCURSO", grupo.fkCurso, "NUMBER", ParameterDirection.Input);
			parameter[2] = new Parametro("NEW_DOCENTE", docente.codigo, "NUMBER", ParameterDirection.Input);
			return conn.OraProcedimiento("FN_LISTARSEMINARIOS", parameter);
		}


		public DataTable GetGrupo(Cgrupo obj)
		{
			grupo.codigo = obj.codigo;
			parameter = new Parametro[1];
			parameter[0] = new Parametro("NEWCODIGO", grupo.codigo);
			return conn.realizarConsulta("PR_CONSULTARGRUPO", "cursor1", parameter);
		}


		
	}
}