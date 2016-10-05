require 'sinatra'

class QuizApi < Sinatra::Base
  get "/" do
    "hello world"
  end

  get "quizzes/" do
    "all quizzes"
  end
end
