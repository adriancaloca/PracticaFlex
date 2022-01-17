
namespace FlexCertificacion.Models
{
    internal class RequireAttribute : Attribute
    {
        public string ErrorMessage { get; set; }
    }
}