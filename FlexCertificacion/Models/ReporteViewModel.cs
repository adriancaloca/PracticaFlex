using Microsoft.AspNetCore.Mvc.Rendering;

namespace FlexCertificacion.Models
{
    public class ReporteViewModel
    {
        public IEnumerable<SelectListItem> LineasProduccion { get; set; }
        public IEnumerable<SelectListItem> EstacionesTrabajo { get; set; }
        public IEnumerable<SelectListItem> Supervisores { get; set; }
        public IEnumerable<SelectListItem> Turnos { get; set; }

        public int Linea { get; set; }
        public int Estacion { get; set; }
        public int Supervisor { get; set; }
        public int Turno { get; set; }
    }
}
