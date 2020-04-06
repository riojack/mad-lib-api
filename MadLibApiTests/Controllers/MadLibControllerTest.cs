using MadLibApi.Controllers;
using Microsoft.Extensions.Logging;
using Moq;
using Xunit;

namespace MadLibApiTests.Controllers
{
    public class MadLibControllerTest
    {
        [Fact]
        public void ShouldHavePopulatedSentence()
        {
            var fakeLogger = new Mock<ILogger<MadLibController>>();
            var madLibController = new MadLibController(fakeLogger.Object);

            var madLibs = madLibController.Get();

            foreach (var madLib in madLibs)
            {
                Assert.NotEmpty(madLib.Sentence);
            }
        }
    }
}
