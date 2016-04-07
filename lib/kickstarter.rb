class KickStarterProject < Scrapper
  
  def initialize(html, url)
    super(html, url)
  end

  def amount_asked
    @doc.search("//div[@id='pledged']").attr('data-goal').to_s.to_i
  end

  def amount_received
    @doc.search("//data[@itemprop='Project[pledged]']").attr('data-value').to_s
  end
  
  def currency
    @doc.search("//data[@itemprop='Project[pledged]']").attr('data-currency').to_s
  end

  def amount_average
    amount_received.gsub(/\D/,'').to_i / backers
  end

  def backers
    @doc.search("//data[@itemprop='Project[backers_count]']").text.to_i
  end

  def time_left
    hours_left = @doc.search("//span[@id='project_duration_data']")
    hours = hours_left.first.attr("data-hours-remaining")
    days_left = hours.to_i/24
    days_left
  end

  def words
    @doc.search("//div[contains(concat(' ', normalize-space(@class), ' '), ' full-description ')]").text.split(" ").count
  end

  def comments
    @doc.search("//data[@itemprop='Project[comments_count]']").text.to_i
  end

  def updates
    @doc.search("//a[@data-content='updates']/span").text.to_i
  end

  def photos
    @doc.search("//div[contains(concat(' ', normalize-space(@class), ' '), ' full-description ')]//img").count
  end

  def videos
    has_video = @doc.search("//div[@id='video-section']").attr("data-has-video").text
    videos_description = @doc.search("//div[contains(concat(' ', normalize-space(@class), ' '), ' oembed')]").count
    
    if has_video.include? "true"
      videos_description + 1
    else
      videos_description
    end
  end

  def location
    loc = @doc.xpath("(//div[contains(concat(' ', normalize-space(@class), ' '), ' NS_projects__category_location ')])[last()]/a[1]/text()").to_s
    loc.gsub(/\n/, '')
  end

  def category
    cat = @doc.xpath("(//div[contains(concat(' ', normalize-space(@class), ' '), ' NS_projects__category_location ')])[last()]/a[2]/text()").to_s
    cat.gsub(/\n/, '')
  end

  def faqs
    @doc.search("//li[@class='faq']").count
  end

  def rewards
    @doc.search("//div/div/div/ol/li").count
  end

  def rewards_amount
    @doc.search("//h2[@class='pledge__amount']//h5/span/text()").map {|r| r.to_s }
  end

  def rewards_words
    @doc.search("//div[@class='pledge__info']/div[1]").map {|r| r.text.split.size }
  end


  def projects_created
    if @doc.to_s.include? "First created"
      return 1
    else
      projects_created_and_backed.map { |p| p.to_s  }[0].to_i
    end
  end

  def projects_backed
    if @doc.to_s.include? "0 backed"
      return 0
    else
      if projects_created == 1
        projects_created_and_backed.map { |p| p.to_s  }[0].to_i
      else
        projects_created_and_backed.map { |p| p.to_s  }[1].to_i
      end
    end
  end

  private
    def projects_created_and_backed
      @doc.search("//a[@class='grey-dark bold remote_modal_dialog']/text()")
    end

end