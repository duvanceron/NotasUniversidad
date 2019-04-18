using Cintensivos_Seminarios.Controllers;
using Ext.Net;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
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
		List<Cnota> listNote;
		DataTable dtNotes;
		DataTable dtSeminarios;
		DataTable dtNotesGroup;
		CultureInfo culture;

		public SeminariosDocente()
		{
			controllerPrematricula = new Cprematricula();
			controllerGrupo = new Cgrupo();
			controllerCurso = new Ccurso();
			controllerDocente = new Cdocente();
			controllerSistema = new Csistema_evaluacion();
			controllerNota = new Cnota();
			controllerCalificacion = new Ccalificacion();
			listNote = new List<Cnota>();
			dtNotesGroup = new DataTable();
			dtNotes = new DataTable();
			dtSeminarios = new DataTable();
			culture = new CultureInfo("en-US");
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






		protected void ConsultGroups(object sender, DirectEventArgs e)
		{
			try
			{
				this.controllerGrupo.fkCurso = Convert.ToInt32(e.ExtraParams["CURS_ID"]);
				this.controllerDocente.codigo = 57425471;



				if (Convert.ToInt32(e.ExtraParams["CURS_ID"]) == 1)
				{
					AddColumnsSeminario(controllerGrupo, controllerDocente);
					StoreStudents.Reload();
					
				}
				else if (Convert.ToInt32(e.ExtraParams["CURS_ID"]) == 2)
				{

					AddColumnsCursoIntensivo(controllerGrupo, controllerDocente);
					StoreStudents.Reload();
					

				}
			}
			catch { }


		}
		/*
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
			

			grid2.ColumnModel.Columns.Add(BuildGridPanel(dtSeminarios));
			string tex = cmbxSistemaEvaluacion.Text;

			grid2.Render();


		}*/

		protected void ConsultNote(object sender, DirectEventArgs e)
		{
			try
			{
				controllerPrematricula.fkgrupo = Convert.ToInt32(e.ExtraParams["CODIGO"]);
				LoadNote(controllerPrematricula);
			}
			catch { }

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
					nameFields[count].Renderer.Fn = "change";
				}
				else
				{
					nameFields[count] = new Column() { Text = RemoveLastWord(column.ColumnName), DataIndex = column.ColumnName, Editor = { new TextField() } };
					nameFields[count].Renderer.Fn = "change";
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
			try
			{
				winDetails.Hidden = false;
				Session["GRUP_NOMBRE"] = Convert.ToString(e.ExtraParams["GRUP_NOMBRE"]);
				Session["CODIGO"] = Convert.ToInt32(e.ExtraParams["CODIGO"]);

				winDetails.Title = Convert.ToString(Session["GRUP_NOMBRE"]);
				controllerNota.grup_Id = Convert.ToInt32(Session["CODIGO"]);
				dtNotesGroup = controllerNota.ConsultarPesosAcademicos(controllerNota);
				stPesos.DataSource = dtNotesGroup;
				stPesos.DataBind();
			} catch { }
		}


		[DirectMethod(Namespace = "notasDocente")]
		public void Edit(int id, string field, string oldValue, string newValue, object customer, int codigo)
		{

			try
			{
				if (IsNumber(newValue) && !IsEmpty(newValue) && IsCorrectTheNota(newValue))
				{
					EditNote(id, field, newValue);
					GridStudents.GetStore().CommitChanges();
					controllerPrematricula.fkgrupo = Convert.ToInt32(codigo);
					LoadNote(controllerPrematricula);

				}
				else
				{
					ShowMessage("Error", "La nota ingresada no es correcta.", Icon.BulletError);
					GridStudents.GetStore().RejectChanges();

				}
			}
			catch { }


		}

		private void EditNote(int premId, string notaId, string note)
		{

			controllerCalificacion.caliId = -1;
			controllerCalificacion.notaId = GetLastWord(notaId);
			controllerCalificacion.caliValor = Convert.ToDouble(note, culture);
			controllerCalificacion.premId = premId;

			controllerCalificacion.MergeNotaIndividual(controllerCalificacion);

		}


		[DirectMethod(Namespace = "notasDocente")]
		public void ModifyNotesGroup(String jsonNotasGroup, String jsonPesos)
		{
			try
			{
				DataTable dtPesos = (DataTable)JsonConvert.DeserializeObject(jsonPesos, (typeof(DataTable)));
				controllerNota.grup_Id = Convert.ToInt32(Session["CODIGO"]);
				dtNotesGroup = controllerNota.ConsultarPesosAcademicos(controllerNota);

				if (dtPesos.Rows.Count > 0)
				{
					DataTable dtdateToRemove = GetInnerData(dtNotesGroup, dtPesos);
					RemoveNoteGroup(dtdateToRemove);
				}


				DataTable dtNotesGroupModify = (DataTable)JsonConvert.DeserializeObject(jsonNotasGroup, (typeof(DataTable)));
				AddNoteGroup(dtNotesGroupModify);


				StoreStudents.Reload();
				RowSelectionModel sm = this.GridAssignedGroups.GetSelectionModel() as RowSelectionModel;
				sm.ClearSelection();
				

				Session.Remove("GRUP_NOMBRE");
				Session.Remove("CODIGO");
				winDetails.Hidden = true;
				ShowMessage("Éxito", "Datos ingresados de manera satisfactoria.", Icon.Accept);
			}
			catch
			{
				ShowMessage("Error", "Verifique la información ingresada", Icon.BulletError);

			};


		}

		private void RemoveNoteGroup(DataTable dtdateToRemove)
		{

			List<Cnota> listNotesGroup = new List<Cnota>();

			listNotesGroup = (from DataRow dr in dtdateToRemove.Rows
							  select new Cnota()
							  {
								  nota_Id = Convert.ToInt32(dr["NOTA_ID"])
							  }).ToList();


			controllerNota.RemoveNoteGroup(listNotesGroup);
		}

		private void AddNoteGroup(DataTable dtdateToAdd)
		{

			List<Cnota> listNotesGroup = new List<Cnota>();

			listNotesGroup = (from DataRow dr in dtdateToAdd.Rows
							  select new Cnota()
							  {
								  nota_Id = Convert.ToInt32(dr["NOTA_ID"]),
								  nota_Nombre = Convert.ToString(dr["DESCRIPCION"]),
								  nota_Porcentaje = Convert.ToInt32(dr["NOTA_PORCENTAJE"]),
								  sise_Id = Convert.ToInt32(dr["SISE_ID"]),
								  grup_Id = Convert.ToInt32(Session["CODIGO"])
							  }).ToList();


			controllerNota.AddNoteGroup(listNotesGroup);
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
				if (Convert.ToDouble(value, culture) >= 0 && Convert.ToDouble(value, culture) <= 5)
				{
					return true;
				}

			}

			return false;
		}



		private DataTable GetInnerData(DataTable dt1, DataTable dt2)
		{
			DataTable dtMerged = (from a in dt1.AsEnumerable()
								  join b in dt2.AsEnumerable()
								  on a["NOTA_ID"].ToString() equals b["NOTA_ID"].ToString()
								  into g
								  where g.Count() > 0
								  select a).CopyToDataTable();

			return dtMerged;
		}

		private void ShowMessage(string title, string message, Icon icono)
		{

			X.Msg.Notify(new NotificationConfig()
			{
				Title = title,
				Html = string.Format(message),
				Icon = icono,
				Width = 200,
				Height = 100
			}).Show();
		}



	}


}