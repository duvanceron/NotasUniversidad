using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Cintensivos_Seminarios.Models;

namespace Cintensivos_Seminarios.Controllers
{
	public class Casignatura
	{
		public Masignatura asignatura;
		public int codigo { get; set; }
		public string nombre { get; set; }
		public Casignatura()
		{
			asignatura = new Masignatura();
		}

		public DataTable ConsultarAsignaturas()
		{
			return asignatura.ConsultarAsignaturas();
		}
	}
}