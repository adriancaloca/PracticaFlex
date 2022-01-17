namespace FlexCertificacion.Models
{
    public class ResultadoReporteModel
    {
        public IEnumerable<EmpleadosReporteViewModel> Certificados { get; set; }
        public IEnumerable<EmpleadosReporteViewModel> CertificadosExpirado { get; set; }
        public IEnumerable<EmpleadosReporteViewModel> Entrenamiento { get; set; }
    }
}
