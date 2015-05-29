require "sinatra"

get "/" do

  erb :home, layout: :template

end

post "/Randomized" do

  erb :home, layout: :template

end
