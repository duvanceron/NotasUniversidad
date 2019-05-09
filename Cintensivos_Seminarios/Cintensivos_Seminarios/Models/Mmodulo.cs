using Cintensivos_Seminarios.BD;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mmodulo
	{
		private Parametro[] parameter;
		private ConnectionOracle conn;

		public Mmodulo()
		{
			conn = new ConnectionOracle();
		}

		public DataTable ConsultarModulos(Mgrupo modelGrupo) {
			parameter = new Parametro[2];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("GRUPO", modelGrupo.codigo, "NUMBER", ParameterDirection.Input);

			return conn.OraProcedimiento("FN_CONSULTARMODULOS",parameter);
		}


	}
}