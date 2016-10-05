# https://github.com/realestate-com-au/pact#2-create-a-skeleton-animal-service-client-class

require 'httparty'
require_relative 'quiz'

class QuizServiceClient
  include HTTParty
  base_uri 'localhost:1234'

  def get_quiz
    response = JSON.parse(self.class.get("/quizzes/1").body)
    id = response['id']
    title = response['title']
    instructions = response['instructions']
    context_id = response['context_id']
    shuffle_questions = response['shuffle_questions']
    shuffle_answers = response['shuffle_answers']

    Quiz.new(
      id: id,
      title: title,
      instructions: instructions,
      context_id: context_id,
      shuffle_questions: shuffle_questions,
      shuffle_answers: shuffle_answers
    )
  end
end
