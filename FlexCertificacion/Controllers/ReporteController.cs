using FlexCertificacion.Models;
using FlexCertificacion.Servicios;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace FlexCertificacion.Controllers
{
    public class ReporteController : Controller
    {
        private readonly IRepositorioReportes repositorioReportes;

        public ReporteController(IRepositorioReportes repositorioReportes)
        {
            this.repositorioReportes = repositorioReportes;
        }
        public async Task<IActionResult> Index()
        {
            var modelo = new ReporteViewModel();
            modelo.LineasProduccion = await ObtenerListaProduccion();
            modelo.EstacionesTrabajo = await ObtenerListaEstaciones();
            modelo.Supervisores = await ObtenerListaSupervisores();
            modelo.Turnos = await ObtenerListaTurnos();
            return View(modelo);
        }
        [HttpPost]
        public async Task<IActionResult> Reporte(ReporteViewModel consulta)
        {
            var modelo = new ResultadoReporteModel();
            modelo.Certificados = await repositorioReportes.ObtenerCertificacionesActivas(consulta);
            modelo.CertificadosExpirado = await repositorioReportes.ObtenerCertificacionesExpiradas(consulta);
            modelo.Entrenamiento = await repositorioReportes.ObtenerEntrenamiento(consulta);
            if(modelo is null)
            {
                return RedirectToAction("NoEncontrado", "Home");
            }
            return View(modelo);
        }
        private async Task<IEnumerable<SelectListItem>> ObtenerListaProduccion()
        {
            var listaLineas = await repositorioReportes.ObtenerLineasProduccion();
            return listaLineas.Select(x => new SelectListItem(x.Nombre, x.Id.ToString()));
        }
        private async Task<IEnumerable<SelectListItem>> ObtenerListaEstaciones()
        {
            var listaLineas = await repositorioReportes.ObtenerEstaciones();
            return listaLineas.Select(x => new SelectListItem(x.Nombre, x.Id.ToString()));
        }
        private async Task<IEnumerable<SelectListItem>> ObtenerListaSupervisores()
        {
            var listaLineas = await repositorioReportes.ObtenerSupervisores();
            return listaLineas.Select(x => new SelectListItem(x.Nombre, x.Id.ToString()));
        }
        private async Task<IEnumerable<SelectListItem>> ObtenerListaTurnos()
        {
            var listaLineas = await repositorioReportes.ObtenerTurnos();
            return listaLineas.Select(x => new SelectListItem(x.Turno, x.Id.ToString()));
        }
    }
}
