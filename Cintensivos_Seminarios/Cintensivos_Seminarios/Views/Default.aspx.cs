using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cintensivos_Seminarios.Controllers;
using Ext.Net;
using System;

namespace Cintensivos_Seminarios.Views
{
	public partial class Default : System.Web.UI.Page
	{
		Cprematricula controllerPrematricula;
		Cgrupo controllerGrupo;
		Ccurso controllerCurso;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!X.IsAjaxRequest)
			{
				/*this.Store1.DataSource = this.GetData();
				this.Store1.DataBind();*/
			}

		}
		public Default()
		{
			controllerPrematricula = new Cprematricula();
			controllerGrupo = new Cgrupo();
			controllerCurso = new Ccurso();
		}
		protected void ConsultNote(object sender, DirectEventArgs e)
		{
		
		

		}

		protected void Button1_Click(object sender, DirectEventArgs e)
		{
			

			Store store = this.Store1;
			GridPanel grid = this.GridPanel1;

			// Clear Collections to remove old Data and Models
			store.Reader.Clear();
			grid.SelectionModel.Clear();
			grid.ColumnModel.Columns.Clear();
			store.Model.Clear();

			// Reconfigure Store
			store.Model.Add(new Model
			{
				Fields =
			{
				new ModelField("NOTA2",ModelFieldType.Float),
				new ModelField("CODIGO"),
				new ModelField("ESTUDIANTE" ),
				new ModelField("NOTA1")
			
			}
			});
			controllerPrematricula.fkgrupo = 1;
			controllerPrematricula.estado = "APROBADO";
			store.DataSource = this.controllerPrematricula.ConsultarPrematriculas(controllerPrematricula);
			store.DataBind();

			// Reconfigure GridPanel
			grid.SelectionModel.Add(new RowSelectionModel { Mode = SelectionMode.Single });

			grid.ColumnModel.Columns.Add(new ColumnBase[] {
			new DateColumn
			{
				Text = "NOTA2",
				DataIndex = "NOTA2"
			},
			new Column
			{
				Text = "CODIGO",
				DataIndex = "CODIGO",
				Flex = 1
			},
			new Column
			{
				Text = "ESTUDIANTE",
				DataIndex = "ESTUDIANTE"
			},
			new DateColumn
			{
				Text = "NOTA1",
				DataIndex = "NOTA1",
				
			}
		});

			// **Make sure to call .Render() on the GridPanel
			grid.Render();
		}

		private object[] GetData()
		{
			return new object[]
			{
			new object[] { "3m Co", 71.72, 0.02, 0.03, "9/1 12:00am" },
			new object[] { "Alcoa Inc", 29.01, 0.42, 1.47, "9/1 12:00am" },
			new object[] { "Altria Group Inc", 83.81, 0.28, 0.34, "9/1 12:00am" },
			new object[] { "American Express Company", 52.55, 0.01, 0.02, "9/1 12:00am" },
			new object[] { "American International Group, Inc.", 64.13, 0.31, 0.49, "9/1 12:00am" },
			new object[] { "AT&T Inc.", 31.61, -0.48, -1.54, "9/1 12:00am" },
			new object[] { "Boeing Co.", 75.43, 0.53, 0.71, "9/1 12:00am" },
			new object[] { "Caterpillar Inc.", 67.27, 0.92, 1.39, "9/1 12:00am" },
			new object[] { "Citigroup, Inc.", 49.37, 0.02, 0.04, "9/1 12:00am" },
			new object[] { "E.I. du Pont de Nemours and Company", 40.48, 0.51, 1.28, "9/1 12:00am" },
			new object[] { "Exxon Mobil Corp", 68.1, -0.43, -0.64, "9/1 12:00am" },
			new object[] { "General Electric Company", 34.14, -0.08, -0.23, "9/1 12:00am" },
			new object[] { "General Motors Corporation", 30.27, 1.09, 3.74, "9/1 12:00am" },
			new object[] { "Hewlett-Packard Co.", 36.53, -0.03, -0.08, "9/1 12:00am" },
			new object[] { "Honeywell Intl Inc", 38.77, 0.05, 0.13, "9/1 12:00am" },
			new object[] { "Intel Corporation", 19.88, 0.31, 1.58, "9/1 12:00am" }
			};
		}

	

	}

}