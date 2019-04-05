using Cintensivos_Seminarios.Models;
using System.Data;

namespace Cintensivos_Seminarios.Controllers
{
	public class Ccalendario
	{
		public Mcalendario_academico calendar;
		public string codigo;
		public string nombre;
		public Ccalendario()
		{
			calendar = new Mcalendario_academico();
		}

		public bool MergeCalendario(Ccalendario obj)
		{
			calendar.codigo = obj.codigo;
			calendar.nombre = obj.nombre;
			return calendar.MergeCalendarioAcademico(calendar);

		}

		public DataTable ConsultarCalendarios()
		{
			return calendar.ConsultarCalendario();
		}
	}
}