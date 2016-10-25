module Musicscraper
  module Boomkat
    class RecommendedNew
      def self.boomkat_all
        new.all
      end

      def all
        zipped.map do |album|
          {
            artist: album[1],
            album: album[0]
          }
        end
      end

      private

      def zipped
        artist_list.zip(album_list)
      end

      def album_list
        total_list.css('strong').map { |a| a.text }
      end

      def artist_list
        total_list.css('span.album-title').map { |a| a.text }
      end

      def total_list
        page.css('div#sb-site div.list-view div.product div.details div.album div.table-cell-text-fit a')
      end

      def page
        @page ||= Nokogiri::HTML(open(boomkat_url).read)
      end

      def boomkat_url
        'https://boomkat.com/new-releases?q[status]=recommended'
      end
    end
  end
end
