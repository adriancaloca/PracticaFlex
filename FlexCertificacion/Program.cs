using FlexCertificacion.Servicios;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddTransient<IRepositorioEmpleados, RepositorioEmpleados>();
builder.Services.AddTransient<IRepositorioTrabajadores, RepositorioTrabajadores>();
builder.Services.AddTransient<IRepositorioReportes, RepositorioReporte>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
