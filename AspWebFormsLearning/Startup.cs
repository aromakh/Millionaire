using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Millionaire.Startup))]
namespace Millionaire
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
