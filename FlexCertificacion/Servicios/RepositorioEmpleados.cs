using Dapper;
using FlexCertificacion.Models;
using Microsoft.Data.SqlClient;

namespace FlexCertificacion.Servicios
{
    public interface IRepositorioEmpleados
    {
        Task Actualizar(Empleado empleado);
        Task Borrar(int id);
        Task Crear(Empleado empleado);
        Task<IEnumerable<Empleado>> Obtener();
        Task<Empleado> ObtenerPorId(int id);
    }
    public class RepositorioEmpleados : IRepositorioEmpleados
    {
        private readonly string connectionString;
        public RepositorioEmpleados(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public async Task Crear(Empleado empleado)
        {
            using var connection = new SqlConnection(connectionString);
            var id = await connection.QuerySingleAsync<int>($@"INSERT INTO empleados(nombre,apepat,apemat,id_puesto,id_supervisor,id_turno) 
                                                values (@Nombre,@Apepat,@Apemat,1,null,@Id_Turno);
                                                SELECT SCOPE_IDENTITY();",empleado);
            empleado.Id = id;
        }
        public async Task<IEnumerable<Empleado>> Obtener()
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<Empleado>("SELECT id,nombre,apepat,apemat,id_turno,id_puesto,id_supervisor from empleados where id_puesto=1");
        }
        public async Task Actualizar(Empleado empleado)
        {
            using var connection = new SqlConnection(connectionString);
            await connection.ExecuteAsync("UPDATE empleados set nombre=@Nombre,apepat=@Apepat,apemat=@Apemat,id_turno=@Id_Turno where id=@Id",empleado);
        }
        public async Task<Empleado> ObtenerPorId(int id)
        {
            using var connection = new SqlConnection(connectionString) ;
            return await connection.QueryFirstOrDefaultAsync<Empleado>(@"SELECT id,nombre,apepat,apemat,id_puesto,id_turno,id_supervisor from empleados where id=@id", new {id});
        }
        public async Task Borrar(int id)
        {
            using var connection = new SqlConnection(connectionString) ;
            await connection.ExecuteAsync("DELETE empleados where id=@id",new {id});
        }
    }
}
