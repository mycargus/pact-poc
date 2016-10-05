# https://github.com/realestate-com-au/pact#1-start-with-your-model

class Quiz
  attr_reader :id, :title, :instructions, :context_id, :shuffle_questions, :shuffle_answers

  def initialize(params)
    @id = params.fetch(:id)
    @title = params.fetch(:title)
    @instructions = params.fetch(:instructions)
    @context_id = params.fetch(:context_id, '1')
    @shuffle_questions = params.fetch(:shuffle_questions, true)
    @shuffle_answers = params.fetch(:shuffle_answers, true)
  end

  def == other
    other.is_a?(Quiz) && other.id == id && other.title == title && other.instructions == instructions && other.context_id == context_id && other.shuffle_questions == shuffle_questions && other.shuffle_answers == shuffle_answers
  end
end
