using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SampleApp.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Monday -> Freezing", "Tuesday -> Sweltering", "Wednesday -> Chilly", "Thursday -> Mild"/*, "Friday -> Muggy"*/
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public IEnumerable<WeatherForecast> Post()
        {
            throw new NotImplementedException();
        }

        [HttpGet]
        public IEnumerable<WeatherForecast> Get()
        {
            var rng = new Random();
            var weatherArray = Enumerable.Range(0, 4).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[index]
            })
            .ToList();

            weatherArray.Add(new WeatherForecast
            {
                Summary = "Friday -> Muggy"
            });

            return weatherArray;
        }
    }
}
