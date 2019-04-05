using Cintensivos_Seminarios.Controllers;
using Ext.Net;
using System;
using System.Data;
using System.Linq;

namespace Cintensivos_Seminarios.Views
{
	public partial class SeminariosDocente : System.Web.UI.Page
	{
		Cprematricula controllerPrematricula;
		Cgrupo controllerGrupo;
		Ccurso controllerCurso;
		Cdocente controllerDocente;
		Csistema_evaluacion controllerSistema;
		Cnota controllerNota;
		Ccalificacion controllerCalificacion;
		DataTable dtNotes;
		DataTable dtSeminarios;
		public SeminariosDocente()
		{
			controllerPrematricula = new Cprematricula();
			controllerGrupo = new Cgrupo();
			controllerCurso = new Ccurso();
			controllerDocente = new Cdocente();
			controllerSistema = new Csistema_evaluacion();
			controllerNota = new Cnota();
			controllerCalificacion = new Ccalificacion();
			dtNotes = new DataTable();
			dtSeminarios = new DataTable();
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!X.IsAjaxRequest)
			{
				this.LoadData();
			}

		}

		private void LoadData()
		{

			/*Consultar los tipos de cursos*/
			Store StCurses = this.GridCourses.GetStore();
			StCurses.DataSource = controllerCurso.consultarCursos();
			StCurses.DataBind();

			StSistemaEvaluacion.DataSource = controllerSistema.ConsultarSistemasEvaluacion();
			StSistemaEvaluacion.DataBind();

		}



		/*public void Refresh(object sender, StoreReadDataEventArgs e)
		{
			this.LoadData();
		}*/


		protected void ConsultGroups(object sender, DirectEventArgs e)
		{
			this.controllerGrupo.fkCurso = Convert.ToInt32(e.ExtraParams["CURS_ID"]);
			this.controllerDocente.codigo = 57425471;
			


			if (Convert.ToInt32(e.ExtraParams["CURS_ID"]) == 1)
			{
				AddColumnsSeminario(controllerGrupo, controllerDocente);
			}
			else if (Convert.ToInt32(e.ExtraParams["CURS_ID"]) == 2)
			{

				AddColumnsCursoIntensivo(controllerGrupo, controllerDocente);
			}


		}

		private void LoadGroups(Cgrupo controllerGrupo, Cdocente controllerDocente)
		{
			Store store2 = this.StoreGroups;
			GridPanel grid2 = this.GridAssignedGroups;

			// Limpia colecciones para remover datos y modelos anteriores 
			store2.Reader.Clear();
			grid2.SelectionModel.Clear();
			grid2.ColumnModel.Columns.Clear();
			store2.Model.Clear();

			dtSeminarios = this.controllerGrupo.ListarSeminarios(controllerGrupo, controllerDocente);
			//Reconfigurar store
			store2.Fields.Add(ConsultFieldsStore(dtSeminarios));
			StoreGroups.DataSource = dtSeminarios;
			StoreGroups.DataBind();
			grid2.SelectionModel.Add(new RowSelectionModel { Mode = SelectionMode.Single });
			/*Reconfigurar gridPanel*/

			grid2.ColumnModel.Columns.Add(BuildGridPanel(dtSeminarios));


			grid2.Render();


		}

		protected void ConsultNote(object sender, DirectEventArgs e)
		{
			controllerPrematricula.fkgrupo = Convert.ToInt32(e.ExtraParams["CODIGO"]);
			controllerPrematricula.estado = "APROBADO";
			LoadNote(controllerPrematricula);

		}

		private void LoadNote(Cprematricula controller)
		{
			Store store = this.StoreStudents;
			GridPanel grid = this.GridStudents;


			//Limpia las colecciones para remover viejos datos y modelos.*/
			store.Reader.Clear();
			grid.SelectionModel.Clear();
			grid.ColumnModel.Columns.Clear();
			store.Model.Clear();


			dtNotes = this.controllerPrematricula.ConsultarPrematriculas(controller);
			/*Reconfigurar  store*/
			store.Fields.Add(ConsultFieldsStore(dtNotes));
			store.DataSource = dtNotes;
			store.DataBind();

			grid.SelectionModel.Add(new RowSelectionModel { Mode = SelectionMode.Single });
			/*Reconfigurar gridPanel*/

			grid.ColumnModel.Columns.Add(BuildGridPanel(dtNotes));


			grid.Render();

		}

		private String[] ConsultFieldsStore(DataTable data)
		{

			string[] nameFields = new string[data.Columns.Count];
			int count = 0;
			foreach (DataColumn column in data.Columns)
			{
				nameFields[count] = column.ColumnName;
				count++;
			}
			return nameFields;


		}

		private ColumnBase[] BuildGridPanel(DataTable data)
		{
			ColumnBase[] nameFields = new ColumnBase[data.Columns.Count + 1];
			nameFields[0] = new RowNumbererColumn();
			int count = 1;
			foreach (DataColumn column in data.Columns)
			{


				if (count <= 1)
				{
					nameFields[count] = new Column() { Text = column.ColumnName, DataIndex = column.ColumnName, Visible = false };
				}
				else if (count < 4)
				{
					nameFields[count] = new Column() { Text = column.ColumnName, DataIndex = column.ColumnName };
				}
				else if (count == 4)
				{
					nameFields[count] = new Column() { Text = column.ColumnName, DataIndex = column.ColumnName, Flex = 1 };
				}
				else if (count == 5)
				{
					nameFields[count] = new Column() { Text = column.ColumnName, DataIndex = column.ColumnName };
				}
				else
				{
					nameFields[count] = new Column() { Text = RemoveLastWord(column.ColumnName), DataIndex = column.ColumnName, Editor = { new TextField() } };
				}
				count++;
			}
			return nameFields;
		}

		private void AddColumnsSeminario(Cgrupo controllerGrupo, Cdocente controllerDocente)
		{
			this.GridAssignedGroups.Reconfigure();
			this.StoreGroups.Model[0].Fields.Add("CODIGO", "GRUP_NOMBRE", "Tema", "Periodó Académico", "Programa académico");

			this.StoreGroups.DataSource = this.controllerGrupo.ConsultarGrupos(controllerGrupo, controllerDocente);
			this.StoreGroups.DataBind();
			Column col = new Column
			{
				Text = "Tema",
				Width = 85,
				Sortable = true,
				DataIndex = "Tema",
				Flex = 1
			};
			Column col2 = new Column
			{
				Text = "Programa académico",
				Width = 85,
				Sortable = true,
				DataIndex = "Programa académico",
				Flex = 1
			};
			this.GridAssignedGroups.InsertColumn(4, col);
			this.GridAssignedGroups.InsertColumn(5, col2);

		}

		private void AddColumnsCursoIntensivo(Cgrupo controllerGrupo, Cdocente controllerDocente)
		{
			this.GridAssignedGroups.Reconfigure();
			this.StoreGroups.Model[0].Fields.Add("CODIGO", "GRUP_NOMBRE", "ASIG_NOMBRE", "Periodó Académico", "ASIG_PROGRAMA");
			this.StoreGroups.DataSource = this.controllerGrupo.ConsultarGrupos(controllerGrupo, controllerDocente);
			this.StoreGroups.DataBind();
			Column col = new Column
			{
				Text = "Asignatura",
				Width = 85,
				Sortable = true,
				DataIndex = "ASIG_NOMBRE",
				Flex = 1
			};
			Column col2 = new Column
			{
				Text = "Programa académico",
				Width = 85,
				Sortable = true,
				DataIndex = "ASIG_PROGRAMA",
				Flex = 1
			};
			this.GridAssignedGroups.InsertColumn(4, col);
			this.GridAssignedGroups.InsertColumn(5, col2); ;

		}




		public void GestionarPesos(object sender, DirectEventArgs e)
		{
			winDetails.Hidden = false;
			winDetails.Title = Convert.ToString(e.ExtraParams["GRUP_NOMBRE"]);


			controllerNota.grup_id = Convert.ToInt32(e.ExtraParams["CODIGO"]);
			stPesos.DataSource = controllerNota.ConsultarPesosAcademicos(controllerNota);
			stPesos.DataBind();
		}


		[DirectMethod(Namespace = "notasDocente")]
		public void Edit(int id, string field, string oldValue, string newValue, object sender, DirectEventArgs e)
		{
			

			if (IsNumber(newValue) && !IsEmpty(newValue)&&IsCorrectTheNota(newValue))
			{
				EditNote(id, field, newValue);
			}
			else
			{
				//string message = "<b>Property:</b> {0}<br /><b>Field:</b> {1}<br /><b>Old Value:</b> {2}<br /><b>New Value:</b> {3}";
				string message = "La nota ingresada no es correcta. ";
				X.Msg.Notify(new NotificationConfig()
				{
					Title = "ERRROR",
					Html = string.Format(message, id, field, oldValue, newValue),
					Icon = Icon.BulletError,
					Width = 200,
					Height = 100
				}).Show();
				
			}
			
		}

		private void EditNote(int premId, string notaId, string note)
		{
			controllerCalificacion.caliId = -1;
			controllerCalificacion.notaId = GetLastWord(notaId);
			controllerCalificacion.caliValor = Convert.ToDouble(note);
			controllerCalificacion.premId = premId;

			controllerCalificacion.MergeNotaIndividual(controllerCalificacion);

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

		private static int GetLastWord(String s)
		{
			string word = s.Split(' ').Last();

			return Convert.ToInt32(word);
		}

		private bool IsNumber(String word)
		{

			if (Double.TryParse(word, out double number))
			{
				return true;
			}
			return false;
		}

		private bool IsEmpty(String word)
		{
			if (string.IsNullOrEmpty(word))
			{
				return true;
			}
			return false;

		}

		private bool IsCorrectTheNota(String value)
		{
			if (IsNumber(value))
			{
				if (Convert.ToDouble(value) >= 0 && Convert.ToDouble(value) <= 5)
				{
					return true;
				}

			}

			return false;
		}



	}


}