import forecastio

FORECAST_TOKEN = "0ecb7ff9cb44d5b0b584844e928d171a"

def forecast(lat=37.512, lng=126.954):
    forecast = forecastio.load_forecast(FORECAST_TOKEN, lat, lng)
    byHourly = forecast.hourly()
    return byHourly.summary

#print(forecast())
