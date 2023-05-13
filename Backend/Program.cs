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

        static Product getProduct(SqlDataReader reader)
        {
            Product product = new Product();
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
            product.saleId = null;
            if (!reader.IsDBNull(15))
            {
                product.saleId = reader.GetInt32(15);
            }
            return product;
        }

        var app = builder.Build();

        app.UseCors(MyAllowSpecificOrigins);

        app.MapGet("/mens-shirts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensShirts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/mens-jackets", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensJackets", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/mens-pants", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensPants", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/mens-shorts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetMensShorts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-shirts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensShirts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-jackets", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensJackets", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-pants", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensPants", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/womens-shorts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWomensShorts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-shirts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsShirts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-jackets", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsJackets", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-pants", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsPants", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/kids-shorts", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetKidsShorts", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/backpacks", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetBackpacks", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/necklaces", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetNecklaces", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/watches", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetWatches", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/hats", async (HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Product> products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("GetHats", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Product product = new Product(getProduct(reader));

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
                        Product product = new Product(getProduct(reader));

                        products.Add(product);
                    }
                }
            }

            return products;
        });

        app.MapGet("/login", async (string username, string password, HttpContext httpContext) =>
        {
            string? connectionString = builder.Configuration.GetConnectionString("local_database");

            List<Account> accounts = new List<Account>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("LogIn", connection);
                command.CommandType = CommandType.StoredProcedure;

                await connection.OpenAsync();

                using (SqlDataReader reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        Account account = new Account();
                        account.accountId = reader.GetInt32(0);
                        account.username = reader.GetString(1);
                        account.password = reader.GetString(2);
                        account.firstName = reader.GetString(3);
                        account.lastName = reader.GetString(4);
                        account.email = reader.GetString(5);
                        account.isLoggedIn = reader.GetInt32(6);
                        accounts.Add(account);
                    }
                }
            }
            LoginEngine loginEngine = new LoginEngine();
            bool isAccount = loginEngine.checkIfAccount(username, password, accounts);

            return isAccount;
        });

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
                        sale.name = reader.GetString(1);
                        sale.startDate = reader.GetDateTime(2);
                        sale.endDate = reader.GetDateTime(3);
                        sale.discount = reader.GetDouble(4);
                        sale.isPercentDiscount = Convert.ToBoolean(reader.GetInt32(5));
                        product.id = reader.GetInt32(6);
                        product.name = reader.GetString(7);
                        product.broadType = reader.GetString(8);
                        product.clothingType = reader.GetString(9);
                        product.price = reader.GetFloat(10);
                        product.numStars = reader.GetFloat(11);
                        product.sku = reader.GetString(12);
                        product.image = reader.GetString(13);
                        product.manufacturer = reader.GetString(14);
                        product.height = reader.GetFloat(15);
                        product.length = reader.GetFloat(16);
                        product.width = reader.GetFloat(17);
                        product.weight = reader.GetFloat(18);
                        product.description = reader.GetString(19);
                        if (reader.GetInt32(20) == 1) { product.isNewArrival = true; }
                        else { product.isNewArrival = false; }
                        product.saleId = null;
                        if (!reader.IsDBNull(reader.GetOrdinal("saleId")))
                        {
                            product.saleId = reader.GetInt32(reader.GetOrdinal("saleId"));
                        }
                        productsAndTheirSale.Add(new Tuple<Product, Sale>(product, sale));
                    }
                }
            }

            return productsAndTheirSale;
        });

        CartEngine cartEngine = new CartEngine();
        app.MapGet("/apply-sale", (double price, bool isPercentDiscount, double discount) =>
        {
            double newPrice = cartEngine.applySale(price, isPercentDiscount, discount);
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
    public int? saleId { get; set; }

    public Product() { }
    public Product(Product product)
    {
        this.id = product.id;
        this.name = product.name;
        this.broadType = product.broadType;
        this.clothingType = product.clothingType;
        this.price = product.price;
        this.numStars = product.numStars;
        this.sku = product.sku;
        this.image = product.image;
        this.manufacturer = product.manufacturer;
        this.height = product.height;
        this.length = product.length;
        this.width = product.width;
        this.weight = product.weight;
        this.description = product.description;
        this.isNewArrival = product.isNewArrival;
        this.saleId = product.saleId;
    }
}

public class Account
{
    public int? accountId { get; set; }
    public string? username { get; set; }
    public string? password { get; set; }
    public string? firstName { get; set; }
    public string? lastName { get; set; }
    public string? email { get; set; }
    public string? phoneNumber { get; set; }
    public int? isLoggedIn { get; set; }
}

public class Sale
{
    public string? name { get; set; }
    public int? id { get; set; }
    public DateTime? startDate { get; set; }
    public DateTime? endDate { get; set; }
    public double discount { get; set; }
    public bool isPercentDiscount { get; set; }
}

