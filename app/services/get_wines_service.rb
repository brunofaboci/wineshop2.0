# frozen_string_literal: true

# class that search for wines on API
class GetWinesService
  BASE_URL = 'https://api.sampleapis.com/wines'

  attr_reader :type

  def initialize(type)
    @type = type
  end

  def search
    get_request(url)
  rescue RestClient::ExceptionWithResponse => e
    notify_api_error(e)
  end

  private

  def get_request(url)
    response = RestClient.get url
    JSON.parse response, symbolize_names: true
  end

  def url
    "#{BASE_URL}/#{type}"
  end

  def notify_api_error(error)
    e = JSON.parse(error.response, symbolize_names: true)
    Rails.logger.error e
    e
  end
end
