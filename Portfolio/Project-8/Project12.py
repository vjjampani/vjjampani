# Course        :   DSC 510
# Week          :   12
# Prog Ass Week :   12.1
# Name          :   Project12.py
# Description   :   Program to print weather for the given city or zip code. with weather api
# That has 3 methods will perform reach action:
# 1. Main method will take input 1 or 2 or exit : 1 for city code, 2 for zip code and exit to quit.
# 2. method 1 : cal_weather_city -- will take input as city name and unit of temperature and print the weather details for that city
# 3. method 2 : cal_weather_zip -- will take input as zi code and unit of temperature and print the weather details for that zip code
# 4. On exit it will prompt the exit. from the program..
# Author        :   VENKAT JAGADEESH JAMPANI
# Date          :   NOV-20-2021
###############################################################################################################
#   Modification History  :
#   SNo     User_Story      Author_Name         Date_of_Change      Change_Approved_By      Date_Moved_To_Prod
#   1       12.1             Venkat Jagadeesh J   NOV-20-2021        Agile PO                DEC-30-2021
################################################################################################################

import requests, json


class WeatherApp:

    def __init__(self):
        self.api_key = 'bea4c605a9b8503b578ec9d91ffc6adf'
        self.base_url = 'https://api.openweathermap.org/data/2.5/weather?'

    def cal_weather_city(self, input_city, input_state, input_units):
        try:
            if input_units.lower() == 'c':
                temp = 'metric'
            elif input_units.lower() == 'f':
                temp = 'imperial'
            else:
                temp = input_units

            final_url = self.base_url + 'q=' + input_city + ',' + input_state + ',840&appid=' + self.api_key + '&units=' + temp
            print(final_url)
            response = requests.get(final_url)
            data = response.json()
            # getting the main dict block
            main = data['main']
            print("########################################################")
            print('Current Weather Conditions For ' + data['name'])
            print('Current Temp: ', main['temp'], 'degrees')
            print('High Temp: ', main['temp_max'], 'degrees')
            print('Low Temp: ', main['temp_min'], 'degrees')
            print('Pressure: ', main['pressure'], 'hPa')
            print('Humidity: ', main['humidity'], '%')
            print('Cloud Cover: ', data['weather'][0]['description'])
            print("########################################################")
        except requests.exceptions.HTTPError as err:
            print(f"Unexpected {err=}, {type(err)=}")

    def cal_weather_zip(self, input_zip_code, input_units):
        try:
            if input_units.lower() == 'c':
                temp = 'metric'
            elif input_units.lower() == 'f':
                temp = 'imperial'
            else:
                temp = input_units

            final_url1 = self.base_url + 'zip=' + input_zip_code + ',us' + '&appid=' + self.api_key + '&units=' + temp
            print(final_url1)
            response = requests.get(final_url1)
            data = response.json()
            # getting the main dict block
            main = data['main']
            print("########################################################")
            print('Current Weather Conditions For ' + data['name'])
            print('Current Temp: ', main['temp'], 'degrees')
            print('High Temp: ', main['temp_max'], 'degrees')
            print('Low Temp: ', main['temp_min'], 'degrees')
            print('Pressure: ', main['pressure'], 'hPa')
            print('Humidity: ', main['humidity'], '%')
            print('Cloud Cover: ', data['weather'][0]['description'])
            print("########################################################")
        except requests.exceptions.HTTPError as err:
            print(f"Unexpected {err=}, {type(err)=}")


def main():
    print('Welcome to the Weather App!')
    wapp = WeatherApp()
    while True:
        user_input = input(
            'Would you like to lookup weather data by US City or zip code? Enter 1 for US City, 2 for zip ,"exit" to exit.. :')
        if user_input.lower() == 'exit':
            print("User Entered 'exit' to exit the weather app,..")
            break
        else:
            try:
                if int(user_input) == 1:
                    input_city = input('Please enter the city name: ')
                    input_state = input('Please enter the state abbreviation: ')
                    print('Would you like to view temps in Fahrenheit, Celsius, or Kelvin.')
                    input_units = input('Enter "F" for Fahrenheit, "C" for Celsius, "K" for Kelvin: ')
                    wapp.cal_weather_city(input_city, input_state, input_units)

                elif int(user_input) == 2:
                    input_zip_code = input('Please enter the zip code: ')
                    print('Would you like to view temps in Fahrenheit, Celsius, or Kelvin.')
                    input_units = input('Enter "F" for Fahrenheit, "C" for Celsius, "K" for Kelvin: ')
                    wapp.cal_weather_zip(input_zip_code, input_units)

            except BaseException as err:
                print(f'Invalid input entered, please enter a valid input:{err}')
                # print("\n weather data by US City or zip code? Enter 1 for US City 2 for zip: 1,'exit' to exit..")


if __name__ == "__main__":
    main()
