using System.Data;
using System.Data.SqlClient;
using Engines;

namespace Backend;

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
                    policy.WithOrigins("http://localhost:3000")
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
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/mens-jackets", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<MensJacket> products = new List<MensJacket>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensJackets", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        MensJacket product = new MensJacket();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/mens-pants", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<MensPants> products = new List<MensPants>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensPants", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        MensPants product = new MensPants();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/mens-shorts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<MensShorts> products = new List<MensShorts>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensShorts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        MensShorts product = new MensShorts();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-shirts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<WomensShirt> products = new List<WomensShirt>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensShirts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        WomensShirt product = new WomensShirt();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-jackets", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<WomensJacket> products = new List<WomensJacket>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensJackets", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        WomensJacket product = new WomensJacket();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-pants", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<WomensPants> products = new List<WomensPants>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensPants", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        WomensPants product = new WomensPants();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-shorts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<WomensShorts> products = new List<WomensShorts>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensShorts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        WomensShorts product = new WomensShorts();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-shirts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<KidsShirt> products = new List<KidsShirt>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsShirts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        KidsShirt product = new KidsShirt();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-jackets", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<KidsJacket> products = new List<KidsJacket>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsJackets", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        KidsJacket product = new KidsJacket();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-pants", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<KidsPants> products = new List<KidsPants>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsPants", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        KidsPants product = new KidsPants();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-shorts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<KidsShorts> products = new List<KidsShorts>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsShorts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        KidsShorts product = new KidsShorts();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/backpacks", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Backpack> products = new List<Backpack>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetBackpacks", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Backpack product = new Backpack();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/necklaces", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Necklace> products = new List<Necklace>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetNecklaces", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Necklace product = new Necklace();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/watches", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Watch> products = new List<Watch>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWatches", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Watch product = new Watch();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/hats", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Hat> products = new List<Hat>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetHats", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Hat product = new Hat();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/home-page", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetNewArrivals", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Hat product = new Hat();
                        product.id = reader.GetInt32(0);
                        product.name = reader.GetString(1);
                        product.broadType = reader.GetString(2);
                        product.clothingType = reader.GetString(3);
                        product.price = reader.GetFloat(4);
                        product.numStars = reader.GetFloat(5);
                        product.sku = reader.GetString(6);
                        product.image = reader.GetString(7);
                        product.manufacturer = reader.GetString(8);
                        product.height = reader.GetFloat(9);
                        product.length = reader.GetFloat(10);
                        product.width = reader.GetFloat(11);
                        product.weight = reader.GetFloat(12);
                        product.description = reader.GetString(13);
                        if (reader.GetInt32(14) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        // app.MapPost("/login", async (HttpContext httpContext) =>
        // {
        //     var isLoggedIn = await Request.ReadFromJsonAsync<int>();

        //     string? connectionString = builder.Configuration.GetConnectionString("local_database");

        //     using (SqlConnection connection = new SqlConnection(connectionString))
        //     {
        //         SqlCommand command = new SqlCommand("LogIn", connection);
        //         command.CommandType = CommandType.StoredProcedure;

        //         await connection.OpenAsync();

        //         command.Parameters.AddWithValue("@LogIn", isLoggedIn);

        //         await command.ExecuteNonQueryAsync();

        //         return Results.Ok("login successful");

        //     }d
        // });

        app.MapGet("/sales", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Tuple<Product, Sale>> productsAndTheirSale = new List<Tuple<Product, Sale>>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetSales", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product();
                        Sale sale = new Sale();
                        sale.id = reader.GetInt32(0);
                        int saleProductId = reader.GetInt32(1);
                        product.id = reader.GetInt32(2);
                        sale.name = reader.GetString(3);
                        sale.startDate = reader.GetDateTime(4);
                        sale.endDate = reader.GetDateTime(5);
                        sale.discount = reader.GetDouble(6);
                        sale.isPercentDiscount = Convert.ToBoolean(reader.GetDouble(7));
                        product.name = reader.GetString(8);
                        product.broadType = reader.GetString(9);
                        product.clothingType = reader.GetString(10);
                        product.price = reader.GetFloat(11);
                        product.numStars = reader.GetFloat(12);
                        product.sku = reader.GetString(13);
                        product.image = reader.GetString(14);
                        product.manufacturer = reader.GetString(15);
                        product.height = reader.GetFloat(16);
                        product.length = reader.GetFloat(17);
                        product.width = reader.GetFloat(18);
                        product.weight = reader.GetFloat(19);
                        product.description = reader.GetString(20);
                        if (reader.GetInt32(21) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }

                        productsAndTheirSale.Add(new Tuple<Product, Sale>(product, sale));
                    }
                }
            }

            return productsAndTheirSale;
        });

        CartEngine cartEngine = new CartEngine();
        app.MapGet("/apply-sale", (double originalPrice, double salePercentage, double dollarAmount) =>
        {
            double newPrice = cartEngine.applySale(originalPrice, salePercentage, dollarAmount);
            return newPrice;
        });



        app.Run();
    }
}

public class Product
{
    public int id { get; set; }
    public string? name { get; set; }
    public string? broadType { get; set; }
    public string? clothingType { get; set; }
    public float price { get; set; }
    public float numStars { get; set; }
    public string? sku { get; set; }
    public string? image { get; set; }
    public string? manufacturer { get; set; }
    public float height { get; set; }
    public float length { get; set; }
    public float width { get; set; }
    public float weight { get; set; }
    public string? description { get; set; }
    public bool? isNewArrival { get; set; }
}

public class Sale
{
    public string? name { get; set; }
    public int? id { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }
    public double discount { get; set; }
    public bool isPercentDiscount { get; set; }
    public List<Product>? saleProducts { get; set; }
}

public class MensShirt : Product { }
public class MensJacket : Product { }
public class MensPants : Product { }
public class MensShorts : Product { }
public class WomensShirt : Product { }
public class WomensJacket : Product { }
public class WomensPants : Product { }
public class WomensShorts : Product { }
public class KidsShirt : Product { }
public class KidsJacket : Product { }
public class KidsPants : Product { }
public class KidsShorts : Product { }
public class Backpack : Product { }
public class Necklace : Product { }
public class Watch : Product { }
public class Hat : Product { }
