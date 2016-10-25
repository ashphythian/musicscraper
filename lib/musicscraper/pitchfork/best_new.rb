module Musicscraper
  module Pitchfork
    class BestNew
      def self.pitchfork_all
        new.all
      end

      def self.pitchfork_albums
        new.albums
      end

      def self.pitchfork_tracks
        new.tracks
      end

      def self.pitchfork_reissues
        new.reissues
      end

      def all
        {
          tracks: tracks,
          albums: albums,
          reissues: reissues
        }
      end

      def tracks
        tracks_zipped.map do |track|
          {
            artist: track[0],
            track: track[1]
          }
        end
      end

      def albums
        albums_zipped.map do |album|
          {
            artist: album[0],
            album: album[1]
          }
        end
      end

      def reissues
        reissues_zipped.map do |reissue|
          {
            artist: reissue[0],
            album: reissue[1]
          }
        end
      end

      private

      def tracks_zipped
        artists(track_list).zip(names(track_list))
      end

      def reissues_zipped
        artists(reissue_list).zip(names(reissue_list))
      end

      def albums_zipped
        artists(album_list).zip(names(album_list))
      end

      def names(item)
        item.map { |a| a.children.children[2].text }
      end

      def artists(item)
        item.map { |a| a.children.children[1].text }
      end

      def album_list
        best_new.css('section#best-new-albums ul.square-list li a.link-block')
      end

      def track_list
        best_new.css('section#best-new-tracks ul.square-list li a.link-block')
      end

      def reissue_list
        best_new.css('section#best-new-reissues ul.square-list li a.link-block')
      end

      def best_new
        page.css('div#best-new-music')
      end

      def page
        @page ||= Nokogiri::HTML(open(pitchfork_url).read)
      end

      def pitchfork_url
        'http://pitchfork.com/best/'
      end
    end
  end
end
