using Cintensivos_Seminarios.Models;
using System;
using System.Data;
namespace Cintensivos_Seminarios.Controllers
{
	public class Cproceso
	{
		public Mproceso proceso;
		public int codigo;
		public string nombre;


		public Cproceso()
		{
			proceso = new Mproceso();
		}

		public Boolean MergeProceso(Cproceso obj)
		{
			proceso.codigo = obj.codigo;
			proceso.nombre = obj.nombre;
			return proceso.MergeProceso(proceso);
		}

		public DataTable ListarProcesos()
		{
			return proceso.ConsultarProcesos();
		}
	}
}