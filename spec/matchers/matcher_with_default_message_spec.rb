require 'rspec/expectations'
include ActionController::UrlFor
#include ActionController::RackDelegation

RSpec::Matchers.define :be_a_created_for do | expected |
  match do | actual |
  expect(actual).to have_http_status(:created)
  expect(actual.headers["Locaton"]).to eql(url_for(expected))
end
failure_message do |actual|
"Expected response to be a <created>, but was #{actual.status}
Expected Location to be a <#{expected.location}>, but was #{actual.headers['Location']}"
end
end
