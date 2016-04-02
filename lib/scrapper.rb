class Scrapper
  
  def doc
    @doc
  end
  
  def initialize(html)
    @doc = html
  end
  
  def amount_asked
    "0"
  end
  
  def amount_received
    "0"
  end
  
  def amount_average
    "0"
  end
  
  def backers
    0
  end
  
  def time_left
    0
  end
  
  def words
    0
  end
  
  def comments
    0
  end
  
  def updates
    0
  end
  
  def photos
    0
  end
  
  def videos
    0
  end
  
  def location
    "n/a"
  end
  
  def category
    "n/a"
  end
  
  def faqs
    0
  end
  
  def rewards
    0
  end
  
  def rewards_amount
    []
  end
  
  def rewards_words
    []
  end
  
  def projects_created
    0
  end
  
  def projects_backed
    0
  end
  
  
  def description
    puts "Asked Amount: #{amount_asked}"
    puts "Received Amount: #{amount_received}"
    puts "Number of Backers: #{backers}"
    puts "Average Amount: #{amount_average}"
    puts "Days Left: #{time_left}"
    puts "Location: #{location}"
    puts "Category: #{category}"
    puts "Number of words: #{words}"
    puts "Number of pics: #{photos}"
    puts "Number of videos: #{videos}"
    puts "Number of comments: #{comments}"
    puts "Number of updates: #{updates}"
    puts "Number of Q/As: #{faqs}"
    puts "Number of rewards: #{rewards}"
    puts "Amount of rewards: #{rewards_amount}"
    puts "Word count in rewards: #{rewards_words}"
    puts "Projects Created: #{projects_created}"
    puts "Projects Backed: #{projects_backed}"
  end
end
  
  