# https://github.com/realestate-com-au/pact#3-configure-the-mock-animal-service

require_relative '../spec_helper'

Pact.service_consumer 'Quiz Web' do
  has_pact_with 'Quiz API' do
    mock_service :quiz_api do
      port 1234
      # standalone true # Tell Pact not to automatically start the mock service
    end
  end
end
