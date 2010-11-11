using System.Linq;

using Health.Direct.Config.Client.DomainManager;
using Health.Direct.Config.Store;

namespace AdminMvc.Models.Repositories
{
    public class AddressRepository : IAddressRepository
    {
        private readonly AddressManagerClient m_client;

        public AddressRepository()
        {
            m_client = new AddressManagerClient();
        }

        protected AddressManagerClient Client { get { return m_client; } }
        
        public IQueryable<Address> FindAll()
        {
            return Client.EnumerateAddresses(null, int.MaxValue).AsQueryable();
        }

        public Address Add(Address address)
        {
            return Client.AddAddress(address);
        }

        public void Update(Address address)
        {
            Client.UpdateAddresses(new[] {address});
        }

        public void Delete(Address address)
        {
            Client.RemoveAddresses(new[]{address.EmailAddress});
        }

        public Address Get(long id)
        {
            return Client.GetAddressesByID(new[] {id}, null).FirstOrDefault();
        }
    }
}