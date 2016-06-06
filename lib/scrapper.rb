class Scrapper
  
  def doc
    @doc
  end
  
  def url
    @url
  end
  
  def title
    @doc.title
  end
  
  def initialize(url)
    @url = url
    @raw = open(url)
    @doc = Nokogiri::HTML(@raw)
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
  
  def currency
    "USD"
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
    puts "Project Title: #{title}"
    puts "Project URL: #{url}"
    puts "Currency: #{currency}"
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
    puts "Number of Q/As (Solo Kick): #{faqs}"
    puts "Number of rewards: #{rewards}"
    puts "Amount of rewards: #{rewards_amount}"
    puts "Word count in rewards: #{rewards_words}"
    puts "Projects Created by User (Solo Kick): #{projects_created}"
    puts "Projects Backed by User (Solo Kick): #{projects_backed}"
    puts "Project Starting Date (No es posible extraer): #{start_date}"
  end
  
  def description_csv
    # URL  | TITLE | CURRENCY | AMOUNT ASKED | AMOUNT RECEIVED | BACKERS | AVG AMOUNT | DAYS LEFT | LOC | CAT
    # NWORD| NPICS | NVIDEOS  | NCOMMENTS    | NUPDATES        | NREWARDS| A REWARDS  | NWORDREWARDS
    print url + "|" + clean(title) + "|" + currency.to_s + "|" + amount_asked.to_s + "|"  + amount_received.to_s + "|"
    print backers.to_s + "|" + amount_average.to_s + "|" + time_left.to_s + "|" + location + "|" + category + "|"
    print words.to_s + "|" + photos.to_s + "|" + videos.to_s + "|" + comments.to_s + "|" + updates.to_s + "|"
    print rewards
    print "|"
    print rewards_amount.to_s[1..-2].gsub("\"","")
    print "|" 
    print rewards_words.to_s[1..-2].gsub("\"","")
    print "\r\n"
  end
  
  private 
  
  def clean(a)
    a.gsub("|","")
    a.gsub("Fondeadora","")
    a.gsub("-Kickstarter","")
    a.gsub("Kickstarter","")
    a.gusb("\r", "")
    a.gusb("\n", "")
    a.strip
  end
end
  
  