module Fact
  class Mixes
    def self.list
      new.list
    end

    def list
      titles.zip(links)
    end

    def releases
      # possible TODO - add release dates
    end

    def links
      mixes.map { |mix| mix.attributes['href'].value }
    end

    def titles
      mixes.map { |mix| mix.attributes['title'].value }
    end

    def mixes
      page.css('div#wrapper div#smart-layout div.block-post-thumbnail a')
    end

    def page
      @page ||= Nokogiri::HTML(open(fact_url))
    end

    def fact_url
      'http://www.factmag.com/category/factmixes'
    end
  end
end
