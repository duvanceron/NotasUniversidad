using Cintensivos_Seminarios.BD;
using System.Collections.Generic;
using System.Data;

namespace Cintensivos_Seminarios.Models
{
	public class Mnota
	{
		public int nota_id { get; set; }
		public string nota_nombre { get; set; }
		public int nota_porcentaje { get; set; }
		public int grup_id { get; set; }
		public int sise_id { get; set; }
		private ConnectionOracle conn;
		private Parametro[] parameter;
		private Transaction[] trans;
		public Mnota()
		{
			conn = new ConnectionOracle();


		}

		public DataTable ConsultarPesosAcademicos(Mnota modelNota)
		{

			parameter = new Parametro[2];
			parameter[0] = new Parametro("CURSOR1", "", "CURSOR", ParameterDirection.ReturnValue);
			parameter[1] = new Parametro("NEW_GRUPID", modelNota.grup_id, "NUMBER", ParameterDirection.Input);

			return conn.OraProcedimiento("FN_LISTARPESOSACADEMICOS", parameter);

		}

		public bool RemoveNoteGroup(List<Mnota> modelNota)
		{

			foreach (var dato in modelNota)
			{
				parameter = new Parametro[1];
				parameter[0] = new Parametro("NEWNOTA_ID", dato.nota_id);

				Transaction[] trans = new Transaction[1];
				trans[0] = new Transaction("PR_DELETENOTAGROUP", parameter);
				conn.realizarTransaccion(trans);
			}

			return true;

		}


		public bool AddNoteGroup(List<Mnota> modelNota)
		{
			
			for (int i = 0; i < modelNota.Count; i++)
			{
				parameter = new Parametro[5];
				parameter[0] = new Parametro("NEWNOTA_ID", modelNota[i].nota_id);
				parameter[1] = new Parametro("NEWNOTA_NOMBRE ", modelNota[i].nota_nombre);
				parameter[2] = new Parametro("NEWNOTA_PORCENTAJE", modelNota[i].nota_porcentaje);
				parameter[3] = new Parametro("NEWGRUP_ID", modelNota[i].grup_id);
				parameter[4] = new Parametro("NEWSISE_ID", modelNota[i].sise_id);

				Transaction[] trans = new Transaction[1];
				trans[0] = new Transaction("PR_MERGEPORCENTAJENOTA", parameter);
				conn.realizarTransaccion(trans);

			}
			

			return true;

		}

	}
}