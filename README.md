# Whether, Sweater? | A Turing 2201 BE Mod 3 Project

##Background & Description
"Whether Sweater" is an individual project that focusses on consuming and creating API endpoints. It combines freely-available weather, location, image, and travel-directions data to serve up information about the weather at queried destinations.

## Features
- Consume several external APIs
- Repackage data into new API endpoints
- Allow user registration and login

## Requirements and Setup (for Mac):
### Ruby and Rails
- Ruby -V 2.7.4
- Rails -V 5.2.6
### Gems Utilized
#### Development/Testing Environments
- rspec-rails
- pry
- simplecov
- factory_bot_rails
- faker
- jsonapi-serializer
- figaro
- shoulda-matchers
- webmock
- vcr
- faker
- factory_bot
#### Production Environment
- faraday
- pexels
- jsonapi-serializer

### Setup
1. Fork and/or Clone this Repo from GitHub.
2. In your terminal use `$ git clone <ssh or https path>`
3. Change into the cloned directory using `$ cd whether_sweater`
4. Install the gem packages using `$ bundle install`
5. Sign up for an Open Weather Map API key: [Open Weather Map](https://openweathermap.org/api)
6. Sign up for a Mapquest API key: [MapQuest](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)
7. Sign up for a Pexels API key: [Pexels](https://www.pexels.com/api/)
8. Add API keys to your ENV using the `config/application.yml` file as shown below:
   ```
    open_weather_api_key: <your api key here>
    map_quest_api_key: <your api key here>
    pexels_api_key: <your api key here>
   ```
9. Startup and Access require the server to be running locally and a web browser opened.
  - Start Server
```shell
$ rails s
```
 - Open Web Broswer and visit http://localhost:3000/
   - Please visit below endpoints to see JSON data being exposed
   ## Testing
    - Test using the terminal utilizing RSpec

    ```shell
    $ rspec spec/<follow directory path to test specific files>
    ```
      or test the whole suite with `$ rspec`


   ## API Endpoints
   #### Retrieve weather for a city: `GET /api/v1/forecast?location=denver,co`
   #### Example Response:
   ```
   {
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-06-14 16:10:36 -0600",
                "sunrise": "2022-06-14 05:31:26 -0600",
                "sunset": "2022-06-14 20:29:10 -0600",
                "temperature": 301.69,
                "feels_like": 300.33,
                "humidity": 22.0,
                "uvi": 4.75,
                "visibility": 10000.0,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2022-06-14",
                    "sunrise": "2022-06-14 05:31:26 -06:00",
                    "sunset": "2022-06-14 20:29:10 -06:00",
                    "max_temp": "301.83 F",
                    "min_temp": "289.38 F",
                    "conditions": "scattered clouds",
                    "icon": "03d"
                }{etc..}
            ],
            "hourly_weather": [
                {
                    "time": "16:00:00",
                    "temperature": "301.69 F",
                    "conditions": "scattered clouds",
                    "icon": "03d"
                } {etc ...}
```

### Retrieve Background Image for the City: `GET /api/v1/backgrounds?location=denver,co`
### Example Response:


{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "height": 6000,
                "width": 4000,
                "location": "denver,co",
                "image_url": "https://www.pexels.com/photo/colleagues-reading-documents-in-the-office-8297446/",
                "author": "Mikhail Nilov"
            }
        }
    }
}
```


#### User Registration: `POST /api/v1/users`
```
{
  "email": "sample@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

#### Example Response:

```
{
    "data": {
        "id": "12",
        "type": "users",
        "attributes": {
            "email": "sample@example.com",
            "api_key": "5mi9h68awl1xu8ukfyr92x79ewu"
        }
    }
}
```

#### User Login: `POST /api/v1/sessions`
```
{
  "email": "whatever@example.com",
  "password": "password"
}
```
#### Example Response:
```
{
    "data": {
        "id": "11",
        "type": "users",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "lo2huigdlaxkr9idyly6wl3nvvi"
        }
    }
}
```

#### Retrieve Weather at Roadtrip Destination: `POST /api/v1/road_trip`
```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
#### Example Response:
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "Pueblo, CO",
            "travel_time": "01 hours, 45 minutes",
            "weather_at_eta": {
                "temperature": "307.21 F",
                "conditions": "clear sky"
            }
        }
    }
}
```
## Further Project Information
 - [Turing Project Details](https://backend.turing.edu/module3/projects/sweater_weather/requirements)
