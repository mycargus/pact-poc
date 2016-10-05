# https://github.com/realestate-com-au/pact#4-write-a-failing-spec-for-the-animal-service-client

require_relative '../../quiz_service_client'
require_relative 'pact_helper'

RSpec.describe QuizServiceClient, :pact => true do
  before do
    QuizServiceClient.base_uri 'localhost:1234'
  end

  subject { QuizServiceClient.new }

  describe 'get_quiz' do
    before do
      quiz_api.given('a quiz with id 1 exists').
        upon_receiving('a request for a quiz').
        with(method: :get, path: '/quizzes/1', query: '').
        will_respond_with(
          status: 200,
          headers: { 'Content-Type' => 'application/json' },
          body: {
            "id": "1",
            "title": "Pop Quiz",
            "instructions": "Take the quiz. Good luck!",
            "context_id": "1",
            "shuffle_questions": true,
            "shuffle_answers": true
          }
        )
    end

    it 'returns the quiz' do
      quiz = Quiz.new(
        id: '1',
        title: 'Pop Quiz',
        instructions: 'Take the quiz. Good luck!'
      )
      expect(subject.get_quiz).to eq(quiz)
    end
  end
end
