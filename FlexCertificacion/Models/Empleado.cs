using FlexCertificacion.Validaciones;
using System.ComponentModel.DataAnnotations;

namespace FlexCertificacion.Models
{
    public class Empleado 
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "El campo {0} es requerido")]
        [StringLength(maximumLength:50, MinimumLength= 3 , ErrorMessage = "Longitud invalida, debe ser entre {2} y {1} caracteres")]
        [Display(Name = "Nombre ")]
        [PrimeraLetraMayuscula]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "El campo {0} es requerido")]
        [StringLength(maximumLength: 50, MinimumLength = 3, ErrorMessage = "Longitud invalida, debe ser entre {2} y {1} caracteres")]
        [Display(Name = "Apellido paterno")]
        public string Apepat { get; set; }
        [Required(ErrorMessage = "El campo {0} es requerido")]
        [StringLength(maximumLength: 50, MinimumLength = 3, ErrorMessage = "Longitud invalida, debe ser entre {2} y {1} caracteres")]
        [Display(Name = "Apellido Materno")]
        public string Apemat { get; set; }
        [Range(minimum:0, maximum:100,ErrorMessage = "Valor invalido")]
        [Display(Name = "Turno")]
        public int Id_Turno { get; set; }
        [Range(minimum: 0, maximum: 100, ErrorMessage = "Valor invalido")]
        [Display(Name = "Puesto")]
        public int Id_Puesto { get; set; }
        [Range(minimum: 0, maximum: 100, ErrorMessage = "Valor invalido")]
        [Display(Name = "Supervisor")]
        public int Id_Supervisor { get; set; }
        public string Supervisor { get; set; }

        
    }
}
