using Contracts;

namespace Backend.Managers
{
    interface LoginManagerInterface
    {
        User processInput(string username, string password);
        User verifyUser(User user);
    }
}
