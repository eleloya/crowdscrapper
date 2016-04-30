class FondeadoraProject < Scrapper

  def initialize(html, url)
    super(html, url)
  end
  
  def currency
    currency = @doc.search("//div[@id='necesita']/div/span[@class='goal']").attr("data-currency").text
    currency
  end

  def amount_asked
    amount = @doc.search("//div[@id='necesita']/div/span[@class='goal']").attr("data-amount").text
    amount.to_i
  end

  def amount_received
    amount = @doc.search("//span[@class='pledged']").attr("data-amount").text
    amount.to_i
  end

  def amount_average
    amount = @doc.search("//span[@class='pledged']").attr("data-amount").text
    amount.to_i / backers
  end

  def backers
    @doc.search("//span[@class='backers']").text.to_i
  end

  def time_left
    seconds = @doc.search("//div[@id='tiempo']/h2[@data-end-time]")
    return 0 if seconds.empty?
    seconds = seconds.attr('data-end-time').text.to_i
    end_time = Time.at(seconds)
    now_time = Time.now
    (end_time.to_date - now_time.to_date).to_i
  end

  def words
    @doc.search("//div[@id='project-about']/div[@class='contenido']").text.split.size
  end

  def comments
   @doc.search("//li[@class='tab-title title-three']//span").text.gsub(/\D/,'').to_i
  end

  def updates
   @doc.search("//li[@class='tab-title title-four']//span").text.gsub(/\D/,'').to_i
  end

  def photos
    #The pictures are repeated twice in the code (for the mobile and desktop version)
    @doc.search("//img[@data-rich-file-id]").count / 2
  end

  def videos
    @doc.search("//div[@id='project-video']/iframe").count
    # Cuando el proyecto no tiene video, el count es cero.
  end

  def location
    @doc.search("//span[@class='location']").text
  end

  def category
    @doc.search("//span[@class='subcategory']").text
  end

  def faqs
    #No tiene seccion especializada en preguntas y respuestas
    0
  end

  def rewards
    @doc.search("//div[@id='project-rewards']//div[@class='reward_head']").count
  end

  def rewards_amount
    @doc.search("//div/div/div/p/span[@class='pledge']").map { |r| "#{r.attr('data-amount')} #{r.attr('data-currency')}"  }
  end

  def rewards_words
    @doc.search("//span[@class='reward_description']").map {|r| r.text.split.size }
  end
  
  def projects_created
    "N/A"
  end
  
  def projects_backed
    "N/A"
  end
  
  def start_date
    "N/A"
  end

  # Projects created and backed not implemented
  # You can only really get "projects backed" and not created.
  # And for that, you need an extra http request. Which I dont feel like coding 

end
