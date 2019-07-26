# frozen_string_literal: true

# Router Class, is going to ask the user what he wants and redirect him to the
# good controller

require 'controller'

class Router
  def initialize
    @controller = Controller.new
  end

  def perform
    system('clear')
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true
      prompt = TTY::Prompt.new
      choices = ['Create Gossip', 'Print Gossip(s)', 'Delete Gossip', 'Exit']
      input = prompt.select("Que souhaitez-vous faire ?\n", choices)
      print "\n"
      case input
      when 'Create Gossip'
        @controller.create_gossip
      when 'Print Gossip(s)'
        @controller.index_gossips
      when 'Delete Gossip'
        @controller.delete_gossip
      when 'Exit'
        system('clear')
        break
      end
      system('clear')
    end
    puts "N'hésite pas à revenir sur le banc des commères du Vieux Port !"
  end
end
