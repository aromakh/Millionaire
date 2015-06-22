using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AspWebFormsLearning.Startup))]
namespace AspWebFormsLearning
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
