using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Web;


namespace Cintensivos_Seminarios.Controllers
{
	public class Reportes
	{
		Document doc;
		iTextSharp.text.Font mainFont;
		Phrase mainPharse;
		PdfWriter writer;
		iTextSharp.text.Image imagen;
		Chunk placeimagen;
		public Reportes()
		{
			doc = new Document(PageSize.A4, 7f, 5f, 5f, 0f);
			/*Estilo de la fuente*/
			mainFont = FontFactory.GetFont("Segoe UI", 22, new iTextSharp.text.BaseColor(System.Drawing.ColorTranslator.FromHtml("#999")));
			/*Para parrafos*/
			mainPharse = new Phrase();
			/*Lugar donde se va a guardar el documento*/
			writer = PdfWriter.GetInstance(doc, new FileStream(@"C:\reporte.pdf", FileMode.Create));
			/*Para agregar una imagen*/
			imagen = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath("~/udla.png"));
			/*Escala la imagen a dimensiones del rectangulo*/
			imagen.ScaleToFit(10, 10);
			/*Construye la imagen en unas posiciones*/
			placeimagen = new Chunk(imagen, 0, -2);
			LoadData();
		}

		public void LoadData()
		{

		}
	}


}