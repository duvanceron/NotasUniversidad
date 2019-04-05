using Cintensivos_Seminarios.BD;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cintensivos_Seminarios.Models
{
	public class Mcalificacion
	{
		public int caliId{ get; set; }
		public int notaId { get; set; } 
		public double caliValor { get; set;}
		public int premId { get; set; }

		private ConnectionOracle connect;
		private Parametro[] parameter;
		private Transaction[] trans;

		public Mcalificacion() {
			connect = new ConnectionOracle();
		}

		public bool MergeNotaIndividual(Mcalificacion modelCalificacion) {

			parameter = new Parametro[4];
			parameter[0] = new Parametro("NEWCALI_ID", modelCalificacion.caliId);
			parameter[1] = new Parametro("NEWNOTA_ID", modelCalificacion.notaId);
			parameter[2] = new Parametro("NEWCALI_VALOR", modelCalificacion.caliValor);
			parameter[3] = new Parametro("NEWPREM_ID", modelCalificacion.premId);
	

			Transaction[] trans = new Transaction[1];
			trans[0] = new Transaction("PR_MERGECALIFICACIONINDIVIDUAL", parameter);

			return connect.realizarTransaccion(trans);
		}
	}
}