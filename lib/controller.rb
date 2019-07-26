# frozen_string_literal: true

class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save
  end

  def show_gossip
    puts "Show Gossip"
    return 'show_gossip'
  end

  def index_gossips
    gossips = Gossip.all
    @view.index_gossips(gossips)
  end

  def delete_gossip
    gossips = Gossip.all
    gossip_number = @view.delete_gossip(gossips)
    if gossip_number != 'exit'
      Gossip.delete_gossip(gossip_number.to_i-1)
    end
  end

end
