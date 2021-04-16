require 'inferkit/configuration'

RSpec.describe Inferkit::Configuration do
  describe '#api_key' do
    context 'when no API key is configured' do
      before do
        allow(ENV).to receive(:[]).with('INFERKIT_API_KEY').and_return(
          'some_api_key'
        )

        Inferkit.configure
      end

      it 'returns the api key from the environment' do
        expect(Inferkit.configuration.api_key).to eq 'some_api_key'
      end
    end

    context 'when configured with an API key' do
      before do
        allow(ENV).to receive(:[]).with('INFERKIT_API_KEY').and_return(
          'some_api_key'
        )

        Inferkit.configure(api_key: 'configured_api_key')
      end

      it 'overrides the key from the environment' do
        expect(Inferkit.configuration.api_key).to eq 'configured_api_key'
      end
    end
  end
end
