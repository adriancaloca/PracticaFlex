using FlexCertificacion.Models;
using FlexCertificacion.Servicios;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace FlexCertificacion.Controllers
{
    public class TrabajadoresController : Controller
    {
        private readonly IRepositorioEmpleados repositorioEmpleados;
        private readonly IRepositorioTrabajadores repositorioTrabajadores;

        public TrabajadoresController(IRepositorioEmpleados repositorioEmpleados,IRepositorioTrabajadores repositorioTrabajadores)
        {
            this.repositorioEmpleados = repositorioEmpleados;
            this.repositorioTrabajadores = repositorioTrabajadores;
        }
        public async Task<IActionResult> Index()
        {
            var Trabajadores = await repositorioTrabajadores.Obtener();
            return View(Trabajadores);
        }
        [HttpGet]
        public async Task<IActionResult> Crear()
        {
            var modelo = new TrabajadorViewModel();
            modelo.Supervisores = await ObtenerSupervisores();
            return View(modelo);
        }
        [HttpPost]
        public async Task<IActionResult> Crear(TrabajadorViewModel trabajador)
        {
            if(trabajador.Id_Puesto != 2)
            {
                return RedirectToAction("NoEncontrado","Home");
            }
            if (!ModelState.IsValid)
            {
                trabajador.Supervisores = await ObtenerSupervisores();
                return View(trabajador);
            }
            await repositorioTrabajadores.Crear(trabajador);
            return RedirectToAction("Index");
        }
        private async Task<IEnumerable<SelectListItem>> ObtenerSupervisores()
        {
            var listaSupervisores = await repositorioEmpleados.Obtener();
            return listaSupervisores.Select(x => new SelectListItem((x.Nombre + " " + x.Apepat), x.Id.ToString()));

        }
        public async Task<IActionResult> Borrar(int id)
        {
            var empelado = await repositorioTrabajadores.ObtenerPorId(id);
            if (empelado is null)
            {
                return RedirectToAction("NoEncontrado", "Index");
            }
            return View(empelado);
        }
        [HttpPost]
        public async Task<IActionResult> BorrarEmpleado(int id)
        {
            var empelado = await repositorioTrabajadores.ObtenerPorId(id);
            if (empelado is null)
            {
                return RedirectToAction("NoEncontrado", "Index");
            }
            await repositorioTrabajadores.Borrar(id);
            return RedirectToAction("Index");
        }
    }
}
