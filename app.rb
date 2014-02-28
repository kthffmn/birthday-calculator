#######################
### B I R T H D A Y ###
#######################
require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/birthday.rb'

class App < Sinatra::Application

	get '/' do
		erb :index
	end

	post '/calculate' do
		bd = Birthday.new(params["birthday"])
		@message = bd.birthday?
		@age = bd.age?
		erb :results
	end

end