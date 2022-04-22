using FluentAssertions;
using Microsoft.AspNetCore.Mvc.Testing;
using SampleApp.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace SampleApp.Tests
{
    public class WeatherForecastTests : IClassFixture<WebApplicationFactory<Api.Startup>>
    {
        private readonly WeatherForecast _sut;
        readonly HttpClient _client;

        public WeatherForecastTests(WebApplicationFactory<Api.Startup> application)
        {
            _sut = new WeatherForecast();
            _client = application.CreateClient();
        }

        [Fact]
        public void TemperatureConversionCorrectness()
        {
            _sut.TemperatureC = 20;
            Assert.Equal((int)(32 + (20 / 0.5556)),
                _sut.TemperatureF);
        }

        [Theory]
        [InlineData((int)(32 + (20 / 0.5556)), 20)]
        [InlineData((int)(32 + (10 / 0.5556)), 10)]
        [InlineData((int)(32 + (99 / 0.5556)), 99)]
        public void TemperatureConversionCorrectnessTheory(
            int expectedConversionF,
            int temperatoreCelcius)
        {
            _sut.TemperatureC = temperatoreCelcius;
            Assert.Equal(expectedConversionF,
                _sut.TemperatureF);
        }

        [Fact]
        public async Task GET_retrieves_weather_forecast()
        {
            var response = await _client.GetAsync("/weatherforecast");
            response.StatusCode.Should().Be(HttpStatusCode.OK);
        }
    }
}
