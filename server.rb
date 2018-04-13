require 'sinatra'
require 'sinatra/reloader'
require 'chuck_norris'


get '/:id' do
  if params[:id] == 'nsfw'
    @joke_explicit = ChuckNorris::JokeFinder.find_joke('random?limitTo=[explicit]')
    erb :nsfw
  elsif params[:id] == 'nerdy'
    @joke_nerdy = ChuckNorris::JokeFinder.find_joke('random?limitTo=[nerdy]')
    erb :nerdy
  elsif params[:id]=='surprise'
    page = rand(2)
    if page == 0
      @joke = ChuckNorris::JokeFinder.find_joke('random?limitTo=[nerdy]')
      erb :surprise
    else
      @joke = ChuckNorris::JokeFinder.find_joke('random?limitTo=[explicit]')
      erb :surprise
    end
  end
end



# @joke = ChuckNorris::JokeFinder.get_joke
# erb :surprise
