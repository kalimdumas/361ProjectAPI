namespace Backend.Managers
{
    public interface ISearchProductsManager
    {
        List<Product> searchProductsByName(string searchString);

        List<Product> searchProductsByCategory(string category);

    }
}
