# frozen_string_literal: true

class View
  def initialize
  end

  def create_gossip
    puts "Tu souhaites créer un Gossip? Très bien ! Raconte moi tout..."
    puts "Qui est l'auteur de ce gossip ?"
    print '> '
    author = gets.chomp
    puts "AAAAAAAH Bon? Très intéressant... Et qu'est qu'il a dit ?"
    print '> '
    content = gets.chomp
    puts "MAAAAAAIS NOOON ?! Très Croustillant tout ça !"
    puts "Bon allez hop, je mets tout ça dans la base de donnée !"
    sleep(2)
    {author: author, content: content}
  end

  def index_gossips(gossips)
    puts "Voici la liste des Gossips :\n\n"
    gossips.each_with_index do |gossip, i|
      puts "#{i+1}. #{gossip.author} a dit : '#{gossip.content}'"
    end
    puts "\n\nC'est tout ce que l'on sait ! A toi de nous donner plus d'information...\n\n"
    puts "Appuie sur Entrée pour revenir au menu principal"
    gets.chomp
  end

  def delete_gossip(gossips)
    puts "Tu souhaites supprimer un gossip? Voici la liste..."
    gossips.each_with_index do |gossip, i|
      puts "#{i+1}. #{gossip.author} a dit : '#{gossip.content}'"
    end
    prompt = TTY::Prompt.new
    choices = ['exit'] + (1..gossips.length).to_a
    prompt.select('Quel Gossip souhaites-tu supprimer ?', choices)
  end
end
