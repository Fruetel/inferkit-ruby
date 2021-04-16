require 'faraday'
require 'json'
require 'oj'

module Inferkit
  class Client
    HOST = 'https://api.inferkit.com'
    GENERATE_ENDPOINT = '/v1/models/standard/generate'

    def generate(prompt, **params)
      request_params = default_params.merge(params)

      response =
        conn.post(GENERATE_ENDPOINT) do |req|
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] =
            "Bearer #{Inferkit.configuration.api_key}"
          req.body = generate_body(prompt, request_params)
        end

      Oj.load(response.body, symbol_keys: true).dig(:data, :text)
    end

    private

    def default_params
      {
        length: 200,
        start_from_beginning: false,
        force_no_end: false,
        top_p: 0.9,
        temperature: 1.0
      }
    end

    def generate_body(prompt, request_params)
      {
        prompt: { text: prompt },
        length: request_params.fetch(:length),
        startFromBeginning: request_params.fetch(:start_from_beginning),
        forceNoEnd: request_params.fetch(:force_no_end),
        topP: request_params.fetch(:top_p),
        temperature: request_params.fetch(:temperature)
      }.to_json
    end

    def conn
      @conn ||= Faraday.new(HOST, request: { timeout: 90 })
    end
  end
end
