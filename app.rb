set :slim, format: :html

@@player = Player.new(1000)
@@deck   = Deck.new


get "/" do
  @@diller = Diller.new
  @@player.flush!
  slim :index
end

get "/hit" do
  @@diller.command(HitCommand.new(@@player.current_hand, @@deck))
  slim :index
end 

get "/deal" do 
  begin 
    @@diller.command(DealCommand.new(@@player, @@diller, @@deck))
    slim :index
  rescue => @e
    slim :error
  end
end

get "/split" do 
  @@diller.command(SplitCommand.new(@@player))
  slim :index
end

get "/stand" do 
  @winner = @@diller.command(StandCommand.new(@@player, @@diller, @@deck))
  slim :index
end

get "/bet/:money" do 
  begin
    @@player.bet!(params[:money].to_f)
    slim :index
  rescue => @e
    slim :error
  end
end

get "/reset" do
  @@player = Player.new(1000)
  @@deck   = Deck.new
  @@diller = Diller.new
  slim :index
end


# Helpers 
helpers do
  def render(*args)
    if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
      return slim "_#{args.first[:partial]}".to_sym, :layout => false
    else
      super
    end
  end
end
