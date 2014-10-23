require 'rspec/expectations'

RSpec::Matchers.define :be_a_created_for do | expected |
  match do | actual |
  expect(actual).to have_http_status(:created)
  expect(actual.headers["Location"]).to eql(expected.location)
end
failure_message do |actual|
"Expected response to be a <created>, but was #{actual.status}
Expected Location to be a <was this?>, but was #{actual.headers['Location']}"
end
end
