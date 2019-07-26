# frozen_string_literal: true

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("db/gossip.csv", "a") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    gossip_array = []
    CSV.read('db/gossip.csv', headers: true).each do |csv|
      gossip_array << Gossip.new(csv['author'], csv['content'])
    end
    gossip_array
  end

  def self.delete_gossip(num)
    gossips = CSV.table('db/gossip.csv')
    gossips.delete(num)
    File.open('db/gossip.csv', 'w') do |f|
      f.write(gossips.to_csv)
    end
  end
end
