using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace ExampleAPI;

public class Program
{
    public static void Main(string[] args)
    {
        var MyAllowSpecificOrigins = "_MyAllowSubdomainPolicy";

        var builder = WebApplication.CreateBuilder(args);

        builder.Services.AddCors(options =>
        {
            options.AddPolicy(name: MyAllowSpecificOrigins,
                policy =>
                {
                    policy.WithOrigins("http://localhost:3000") // TODO: change to the port number that the frontend application runs on
                        .AllowAnyHeader()
                        .AllowAnyMethod();
                });
        });

        var app = builder.Build();

        app.UseCors(MyAllowSpecificOrigins);

        app.MapGet("/mens-shirts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<MensShirt> products = new List<MensShirt>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensShirts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        MensShirt product = new MensShirt();
                        product.productId = reader.GetInt32(0);
                        product.name = reader.GetString(1);

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.Run();
    }
}

public class MensShirt
{
    public int productId { get; set; }
    public string? name { get; set; }
}