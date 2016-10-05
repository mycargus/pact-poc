# https://github.com/realestate-com-au/pact#2-tell-your-provider-that-it-needs-to-honour-the-pact-file-you-made-earlier

require_relative '../spec_helper'
require 'pact/provider/rspec'

Pact.service_provider 'Quiz API' do
  honours_pact_with 'Quiz Web' do
    # Each interaction in a pact should be verified in isolation,
    # with no context maintained from the previous interactions!

    # For additional important details, see
    # https://github.com/realestate-com-au/pact/wiki/Provider-states
    Pact.provider_states_for 'Quiz Web' do

      provider_state 'a quiz with id 1 exists' do
        quiz_params = {
          title: 'Pop Quiz',
          instructions: 'Take the quiz. Good luck!'
        }

        set_up do
          @quiz = QuizApi.new(quiz_params)
          @quiz.save
        end

        tear_down do
          @quiz.destroy
        end
      end
    end

    # This example points to a local file, however, on a real project with a continuous
    # integration box, you would use a [Pact Broker](https://github.com/bethesque/pact_broker) or publish your pacts as artifacts,
    # and point the pact_uri to the pact published by the last successful build.

    pact_uri '../consumer/spec/pacts/quiz_web-quiz_api.json'
  end
end
