namespace FlexCertificacion.Models
{
    public class EmpleadosReporteViewModel
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Supervisor { get; set; }
        public DateTime Fecha { get; set; }
        public string Turno { get; set; }
        public string Linea { get; set; }
        public string Estacion { get; set; }
    }
}
