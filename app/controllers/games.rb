post '/games' do
  @game = Game.create!
end

get '/games' do
  erb :'game_start'
end

put '/games' do
  return"You are totally weighing things"
end
