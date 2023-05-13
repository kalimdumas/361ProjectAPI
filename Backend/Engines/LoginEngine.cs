using Backend;

namespace Engines
{
    public class LoginEngine
    {
        public bool checkIfAccount(string username, string password, List<Account> accounts) {
            foreach(Account account in accounts){
                if(account.username == username && account.password == password){
                    return true;
                }
            }
            return false;
        }
    }
}
