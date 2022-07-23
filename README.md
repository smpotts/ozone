# Ozone
This project uses the AirNow API to look up the air quality index (AQI) by zip code. The AQI was developed by the EPA
and calculates scores based on levels of ozone, air particle pollution, and other pollutants. 

## AQI Scale
The application takes a zip code and displays a score of the AQI rating and a color coded categories corresponding to the 
[chart](https://docs.airnowapi.org/aq101) on the AirNow website.

## Technologies
Ruby version 2.6.8p205

## Running the project
1. Start the rails server and to localhost:3000
2. When the webpage is up, navigate to the top left corner and enter a zip code in the search bar
3. The page will then display the AQI number for that zip code as well as the color that corresponds to the AQI value. Example:

[![Screen-Shot-2022-07-23-at-9-02-00-AM.png](https://i.postimg.cc/KvjPmkdk/Screen-Shot-2022-07-23-at-9-02-00-AM.png)](https://postimg.cc/mtxzwDZB)
