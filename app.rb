require "sinatra"

enable :sessions
get "/" do

  erb :home, layout: :template

end

post "/Randomized" do

  @names = params[:names].split(",").shuffle
  @num_teams = params[:number].to_i
  @error = true if @num_teams > @names.length || @num_teams < 1

  if @error == nil
    session['num'] = @num_teams
    session['names'] = @names
    @arrays = Array.new(@num_teams) { [] }
    @names.each_with_index do |name, i|
      @arrays[i % @num_teams] << name
    end
    @arrays.each_with_index do |team, i|
      session["#{i+1}"] = team.join("\n")
    end
  end
  erb :home, layout: :template


end
