get '/games' do
  @scale = Scale.create(name: "scale")
  @balls = []
  num = 1
  12.times do
  @balls << Ball.new(scale: @scale, number: num.to_s)
  num += 1
  end
  @balls[rand(0..11)].change_weight
  erb :'game_start'
end
