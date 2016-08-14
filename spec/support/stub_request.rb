require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(
        :get,
        "https://maps.googleapis.com/maps/api/directions/json?departure_time=now&destination=-22.908365,-46.6284125&language=pt-BR&mode=driving&origin=-23.5507845,-46.6338611&units=metric"
      )
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.9.2'
        }
      )
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/google_directions/200_with_steps.json').read,
        headers: {}
      )

    stub_request(
        :get,
        "https://maps.googleapis.com/maps/api/directions/json?departure_time=now&destination=&language=pt-BR&mode=driving&origin=&units=metric"
      )
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.9.2'
        }
      )
      .to_return(
        status: 400,
        body: File.new('spec/fixtures/google_directions/400_with_message.json').read,
        headers: {}
      )

    stub_request(
        :get,
        "https://maps.googleapis.com/maps/api/directions/json?departure_time=now&destination=1,1&language=pt-BR&mode=driving&origin=1,1&units=metric"
      )
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.9.2'
        }
      )
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/google_directions/200_no_results.json').read,
        headers: {}
      )
  end
end
