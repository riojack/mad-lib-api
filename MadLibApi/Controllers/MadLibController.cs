using System;
using System.Collections.Generic;
using System.Linq;
using MadLibApi.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace MadLibApi.Controllers
{
    [ApiController]
    [Route("madlib")]
    public class MadLibController : ControllerBase
    {

        private readonly ILogger<MadLibController> _logger;

        public MadLibController(ILogger<MadLibController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public void Post([FromBody] MadLib madLib) {
            _logger.LogInformation($"POST happened with sentence: {madLib.Sentence}");
        }

        [HttpGet]
        public IEnumerable<MadLib> Get()
        {
            _logger.LogInformation("GET happened.");
            return Enumerable.Range(1, 5).Select(index => new MadLib
            {
                Sentence = Guid.NewGuid().ToString()
            })
            .ToArray();
        }
    }
}
