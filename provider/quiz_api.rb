require 'sinatra'

class QuizApi < Sinatra::Base
  get "/" do
    "hello world"
  end

  get "quizzes/1" do
    # if you implement a database for Quiz API, then you'd want to query that db here
  end
end
