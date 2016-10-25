module Musicscraper
  module Boomkat
    class RecommendedNew
      attr_reader :genre

      def initialize(genre='')
        @genre = genre
      end

      def self.boomkat_all(genre='')
        new(genre).all
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
        "https://boomkat.com/new-releases?q[status]=recommended&q[genre]=#{genre_map}"
      end

      def genre_map
        genres[genre]
      end

      def genres
        {
          'Dub Techno' => 62,
          'Hip-Hop' => 54,
          'Dark Ambient/Drone' => 57,
          'Disco/Funk' => 45,
          'Dub' => 55,
          'Early Electronic/Soundtrack' => 51,
          'Electronic' => 46,
          'Noise' => 56,
          'Folk' => 60,
          'Grime' => 52,
          'Indie/Alternative' => 49,
          'Industrial' => 47,
          'Jazz' => 58,
          'Jungle/Footwork' => 50,
          'Ambient/Modern Classical' => 44,
          'Techno/House' => 48,
          'World' => 53
        }
      end
    end
  end
end
