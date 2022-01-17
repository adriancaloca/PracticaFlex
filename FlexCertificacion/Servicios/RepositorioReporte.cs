using Dapper;
using FlexCertificacion.Models;
using System.Data.SqlClient;

namespace FlexCertificacion.Servicios
{
    public interface IRepositorioReportes
    {
        Task<IEnumerable<EmpleadosReporteViewModel>> ObtenerCertificacionesActivas(ReporteViewModel data);
        Task<IEnumerable<EmpleadosReporteViewModel>> ObtenerCertificacionesExpiradas(ReporteViewModel datos);
        Task<IEnumerable<EmpleadosReporteViewModel>> ObtenerEntrenamiento(ReporteViewModel datos);
        Task<IEnumerable<EstacionTrabajo>> ObtenerEstaciones();
        Task<IEnumerable<LineaProduccion>> ObtenerLineasProduccion();
        Task<IEnumerable<SupervisorViewModel>> ObtenerSupervisores();
        Task<IEnumerable<Turnos>> ObtenerTurnos();
    }
    public class RepositorioReporte : IRepositorioReportes
    {
        private readonly string connectionString;
        public RepositorioReporte(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public async Task<IEnumerable<LineaProduccion>> ObtenerLineasProduccion()
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<LineaProduccion>("SELECT id,nombre from lineas_produccion");
        }
        public async Task<IEnumerable<EstacionTrabajo>> ObtenerEstaciones()
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<EstacionTrabajo>("SELECT id,nombre,id_linea from estaciones_trabajo");
        }
        public async Task<IEnumerable<SupervisorViewModel>> ObtenerSupervisores()
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<SupervisorViewModel>("SELECT id,nombre from empleados where id_puesto=1");
        }
        public async Task<IEnumerable<Turnos>> ObtenerTurnos()
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<Turnos>("SELECT id,turno from turnos");
        }
        public async Task<IEnumerable<EmpleadosReporteViewModel>> ObtenerCertificacionesActivas(ReporteViewModel datos)
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<EmpleadosReporteViewModel>(@"select e.id as id,CONCAT(e.nombre,' ',e.apepat,' ',e.apemat) as nombre,CONCAT(s.nombre,' ',s.apepat,' ',s.apemat) as supervisor,c.fecha as fecha, t.turno as turno, lp.nombre as linea, et.nombre as estacion from certificaciones c inner join empleados e on c.id_empleado=e.id inner join empleados s on e.id_supervisor=s.id inner join turnos t on e.id_turno=t.id inner join estaciones_trabajo et on c.id_estacion=et.id inner join lineas_produccion lp on et.id_linea=lp.id where lp.id="+@datos.Linea+" and c.id_estacion="+@datos.Estacion+" and DATEDIFF(month,c.fecha,GETDATE()) < 6 and c.porcentaje=100");
        }
        public async Task<IEnumerable<EmpleadosReporteViewModel>> ObtenerCertificacionesExpiradas(ReporteViewModel datos)
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<EmpleadosReporteViewModel>(@"select e.id as id,CONCAT(e.nombre,' ',e.apepat,' ',e.apemat) as nombre,CONCAT(s.nombre,' ',s.apepat,' ',s.apemat) as supervisor,c.fecha as fecha, t.turno as turno, lp.nombre as linea, et.nombre as estacion from certificaciones c inner join empleados e on c.id_empleado=e.id inner join empleados s on e.id_supervisor=s.id inner join turnos t on e.id_turno=t.id inner join estaciones_trabajo et on c.id_estacion=et.id inner join lineas_produccion lp on et.id_linea=lp.id where lp.id=" + @datos.Linea + " and c.id_estacion=" + @datos.Estacion + " and DATEDIFF(month,c.fecha,GETDATE()) > 6 and c.porcentaje=100");
        }
        public async Task<IEnumerable<EmpleadosReporteViewModel>> ObtenerEntrenamiento(ReporteViewModel datos)
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<EmpleadosReporteViewModel>(@"select e.id as id,CONCAT(e.nombre,' ',e.apepat,' ',e.apemat) as nombre,CONCAT(s.nombre,' ',s.apepat,' ',s.apemat) as supervisor,c.fecha as fecha, t.turno as turno, lp.nombre as linea, et.nombre as estacion from certificaciones c inner join empleados e on c.id_empleado=e.id inner join empleados s on e.id_supervisor=s.id inner join turnos t on e.id_turno=t.id inner join estaciones_trabajo et on c.id_estacion=et.id inner join lineas_produccion lp on et.id_linea=lp.id where lp.id=" + @datos.Linea + " and c.id_estacion=" + @datos.Estacion + " and c.porcentaje < 100;");
        }
    }
}
