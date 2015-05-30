require "sinatra"

get "/" do

  erb :home, layout: :template

end

post "/Randomized" do
  params.to_s
  @names = params[:names].split(",").shuffle
  @num_teams = params[:number].to_i

  @arrays = Array.new(@num_teams) { [] }
  @names.each_with_index do |name, i|
    @arrays[i % @num_teams] << name
  end
  
  erb :home, layout: :template


end
