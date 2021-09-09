class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=80111&distance=1&API_KEY=4438F9C4-71AF-420A-9503-6491DE0C996B'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    # check for empty return result
    if @output.empty?
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color = "gray"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Good"
    elsif @final_output >= 51 and @final_output <= 100
      @api_color = "yellow"
      @api_description = "Moderate"
    elsif @final_output >= 101 and @final_output <= 150
      @api_color = "orange"
      @api_description = "Unhealthy for sensitive groups"
    elsif @final_output >= 151 and @final_output <= 200
      @api_color = "red"
      @api_description = "Unhealthy"
    elsif @final_output >= 201 and @final_output <= 300
      @api_color = "purple"
      @api_description = "Very Unhealthy"
    elsif @final_output >= 301 and @final_output <= 500
      @api_color = "maroon"
      @api_description = "Hazardous"
    end

  end

  def zipcode
    @zip_query = params[:zipcode]
    if params[:zipcode] == ""
      @zip_query = "Please enter a zipcode."
    elsif params[:zipcode]
      # do api things  
      require 'net/http'
      require 'json'
  
      @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query.to_s + '&distance=1&API_KEY=4438F9C4-71AF-420A-9503-6491DE0C996B'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)
  
      # check for empty return result
      if @output.empty?
        @final_output = "Error"
      else
        @final_output = @output[0]['AQI']
      end
  
      if @final_output == "Error"
        @api_color = "gray"
      elsif @final_output <= 50
        @api_color = "green"
        @api_description = "Good"
      elsif @final_output >= 51 and @final_output <= 100
        @api_color = "yellow"
        @api_description = "Moderate"
      elsif @final_output >= 101 and @final_output <= 150
        @api_color = "orange"
        @api_description = "Unhealthy for sensitive groups"
      elsif @final_output >= 151 and @final_output <= 200
        @api_color = "red"
        @api_description = "Unhealthy"
      elsif @final_output >= 201 and @final_output <= 300
        @api_color = "purple"
        @api_description = "Very Unhealthy"
      elsif @final_output >= 301 and @final_output <= 500
        @api_color = "maroon"
        @api_description = "Hazardous"
      end

    end
  end
end
