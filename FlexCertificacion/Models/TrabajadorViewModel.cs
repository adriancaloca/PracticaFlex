using Microsoft.AspNetCore.Mvc.Rendering;

namespace FlexCertificacion.Models
{
    public class TrabajadorViewModel : Empleado
    {
        public IEnumerable<SelectListItem> Supervisores { get; set; }
        public string Supervisor { get; set; }
        
    }
}
