require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :new
  end

  post '/student' do
    # create a new Student using the info stored in params[:student]
    @student = Student.new(params[:student])

    # iterate over params[:student][:courses] array, which looks like this:
    # [ 
    #   0 => {
    #     "name" => "AP US History", 
    #     "topic" => "History"
    #   }, 
    #   1 => {
    #     "name" => "AP Human Geography", 
    #     "topic" => "History"
    #   }
    # ]

    # during the iteration, use the course values passed into the .each
    # block to create instances of the Course. We store the instantiated
    # courses in the instance variable @courses to make it available within
    # the view, student.erb
    params[:student][:courses].each do |details|
      Course.new(details)
    end

    @courses = Course.all

    erb :student #loads into view
  end

end
