using Dapper;
using FlexCertificacion.Models;
using Microsoft.Data.SqlClient;

namespace FlexCertificacion.Servicios
{
    public interface IRepositorioTrabajadores
    {
        Task Borrar(int id);
        Task Crear(Empleado empleado);
        Task<IEnumerable<Empleado>> Obtener();
        Task<Empleado> ObtenerPorId(int id);
    }
    public class RepositorioTrabajadores : IRepositorioTrabajadores
    {
        private readonly string connectionString;

        public RepositorioTrabajadores(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task Crear(Empleado empleado)
        {
            using var connection = new SqlConnection(connectionString);
            var id = await connection.QuerySingleAsync<int>($@"INSERT INTO empleados(nombre,apepat,apemat,id_puesto,id_supervisor,id_turno) 
                                                values (@Nombre,@Apepat,@Apemat,2,@Supervisor,@Id_Turno);
                                                SELECT SCOPE_IDENTITY();", empleado);
            empleado.Id = id;
        }
        public async Task<IEnumerable<Empleado>> Obtener()
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<Empleado>("SELECT e.id,e.nombre,e.apepat,e.apemat,concat(s.nombre ,' ', s.apepat) as supervisor from empleados e inner join empleados s on s.id=e.id_supervisor where e.id_puesto=2");
        }
        public async Task<Empleado> ObtenerPorId(int id)
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryFirstOrDefaultAsync<Empleado>(@"SELECT id,nombre,apepat,apemat,id_puesto,id_turno,id_supervisor from empleados where id=@id", new { id });
        }
        public async Task Borrar(int id)
        {
            using var connection = new SqlConnection(connectionString);
            await connection.ExecuteAsync("DELETE empleados where id=@id", new { id });
        }
    }
}
