post '/games' do
  @game = Game.create!
  session[:game_id] = @game.id
  redirect '/games'
end

get '/games' do
  @game = Game.find(session[:game_id])
  @balls = @game.balls.sort_by &:id
  erb :'game_start'
end

put '/games' do
  @game = Game.find(session[:game_id])
  @game.weigh(params).to_json
end

get '/games/end' do
  @game = Game.find(session[:game_id])
  @results = @game.check_win_conditions(params)
  puts @results
  erb :'results'
end
