using Microsoft.AspNet.FriendlyUrls;
using System.Web.Mvc;
using System.Web.Routing;

namespace Cintensivos_Seminarios
{
	public class RouteConfig
	{
		public static void RegisterRoutes(RouteCollection routes)
		{
			//routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

			//routes.MapRoute(
			//    name: "Default",
			//    url: "{controller}/{action}/{id}",
			//    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
			//);

			var settings = new FriendlyUrlSettings();
			settings.AutoRedirectMode = RedirectMode.Permanent;
			routes.EnableFriendlyUrls(settings);

			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
			routes.IgnoreRoute("{exclude}/{extnet}/ext.axd");
			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

			routes.MapRoute(
					name: "Default",
					url: "{controller}/{action}/{id}",
					defaults: new { action = "Index", id = UrlParameter.Optional }
			);
		}
	}
}

