require 'inferkit/configuration'
require 'inferkit/client'
require 'webmock'

RSpec.describe Inferkit::Client do
  subject(:client) { Inferkit::Client.new }

  before do
    WebMock.enable!
    Inferkit.configure(api_key: 'API_KEY')
  end

  after { WebMock.reset_callbacks }

  describe('#generate') do
    context 'when no params are provided' do
      before do
        stub_request(
          :post,
          'https://api.inferkit.com/v1/models/standard/generate'
        ).with(
          body: {
            'prompt' => { 'text' => 'some prompt' },
            'length' => 200,
            'startFromBeginning' => false,
            'forceNoEnd' => false,
            'topP' => 0.9,
            'temperature' => 1
          },
          headers: {
            'Content-Type' => 'application/json',
            'Authorization' => 'Bearer API_KEY'
          }
        ).to_return({ body: '{"data": {"text": "expected text"}}' })
      end

      it 'generates a text via the Inferkit API with default params' do
        result = client.generate('some prompt')

        expect(result).to eq 'expected text'
      end
    end
  end

  context 'when params are provided' do
    before do
      stub_request(
        :post,
        'https://api.inferkit.com/v1/models/standard/generate'
      ).with(
        body: {
          'prompt' => { 'text' => 'some prompt' },
          'length' => 1000,
          'startFromBeginning' => true,
          'forceNoEnd' => true,
          'topP' => 0.5,
          'temperature' => 5
        },
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => 'Bearer API_KEY'
        }
      ).to_return({ body: '{"data": {"text": "expected text"}}' })
    end

    it 'generates a text via the Inferkit API' do
      result =
        client.generate(
          'some prompt',
          length: 1000,
          start_from_beginning: true,
          force_no_end: true,
          top_p: 0.5,
          temperature: 5
        )

      expect(result).to eq 'expected text'
    end
  end
end
