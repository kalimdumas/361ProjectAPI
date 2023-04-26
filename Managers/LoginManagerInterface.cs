using OnlineStore.Contracts;
using System.Runtime.Serialization;

namespace OnlineStore.Managers
{
    interface LoginManagerInterface
    {
        User processInput(string username, string password);
        User verifyUser(User user);
    }
}
