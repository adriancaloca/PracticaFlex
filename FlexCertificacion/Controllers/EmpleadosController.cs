using Dapper;
using FlexCertificacion.Models;
using FlexCertificacion.Servicios;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace FlexCertificacion.Controllers
{
    public class EmpleadosController : Controller
    {
        private readonly IRepositorioEmpleados repositorioEmpleados;

        public EmpleadosController(IRepositorioEmpleados repositorioEmpleados)
        {
            this.repositorioEmpleados = repositorioEmpleados;
        }
        public async Task<IActionResult> Index()
        {
            var Empleados = await repositorioEmpleados.Obtener();
            return View(Empleados);
        }
        public IActionResult Crear()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Crear(Empleado empleado)
        {
            //Si el modelo no es correcto
            if (!ModelState.IsValid)
            {
                return View(empleado);
            }
            await repositorioEmpleados.Crear(empleado);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<ActionResult> Editar(int id)
        {
            //No se reciben datos de id
            var empleado = await repositorioEmpleados.ObtenerPorId(id);
            if(empleado is null){
                return RedirectToAction("NoEncontrado","Home");
            }

            return View(empleado);
        }
        [HttpPost]
        public async Task<ActionResult> Editar(Empleado empleado)
        {
            var empleadoExiste = await repositorioEmpleados.ObtenerPorId(empleado.Id);

            if (empleadoExiste is null)
            {
                return RedirectToAction("NoEncontrado", "Home");
            }

            await repositorioEmpleados.Actualizar(empleado);
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Borrar(int id)
        {
            var empelado = await repositorioEmpleados.ObtenerPorId(id);
            if (empelado is null)
            {
                return RedirectToAction("NoEncontrado", "Index");
            }
            return View(empelado);
        }
        [HttpPost]
        public async Task<IActionResult> BorrarEmpleado(int id)
        {
            var empelado = await repositorioEmpleados.ObtenerPorId(id);
            if (empelado is null)
            {
                return RedirectToAction("NoEncontrado", "Index");
            }
            await repositorioEmpleados.Borrar(id);
            return RedirectToAction("Index");
        }
    }
}
