using Cintensivos_Seminarios.BD;
using Cintensivos_Seminarios.Models;
using System;
using System.Collections.Generic;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cnota
	{
		private Mnota modelNota;
		public int nota_Id { get; set; }
		public string nota_Nombre { get; set; }
		public int nota_Porcentaje { get; set; }
		public int grup_Id  {get;set;}
		public int sise_Id { get; set; }
		public int doceId { get; set; }

		public Cnota()
		{
			modelNota = new Mnota();
		}

		public DataTable ConsultarPesosAcademicos( Cnota controllerNota)
		{
			modelNota.grup_id = controllerNota.grup_Id;

			return modelNota.ConsultarPesosAcademicos(modelNota); ;
		}


		public bool RemoveNoteGroup(List<Cnota> controllerNota)
		{
			List<Mnota> listNotesGroup = new List<Mnota>();
			foreach (var dato in controllerNota) {
				modelNota = new Mnota
				{
					nota_id = dato.nota_Id
				};
				listNotesGroup.Add(modelNota);
			}
			
			return modelNota.RemoveNoteGroup(listNotesGroup); 
		}

		public bool AddNoteGroup(List<Cnota> controllerNota)
		{
			List<Mnota> listNotesGroup = new List<Mnota>();
			foreach (var dato in controllerNota)
			{
				modelNota = new Mnota
				{
					nota_id = dato.nota_Id,
					nota_nombre=RemoveLastWord(dato.nota_Nombre),
					nota_porcentaje=dato.nota_Porcentaje,
					sise_id=dato.sise_Id,
					grup_id=dato.grup_Id,
					doceId=dato.doceId
				};
				listNotesGroup.Add(modelNota);
			}

			return modelNota.AddNoteGroup(listNotesGroup);
		}

		private static String RemoveLastWord(String s)
		{
			int pos;
			s = s.Trim();
			pos = s.LastIndexOf(" ");
			if (pos != -1)
			{
				s = s.Substring(0, pos);
			}
			else
			{
				s = "" + s;
			}
			return s;
		}


	}
}