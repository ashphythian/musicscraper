require "musicscraper/all"

module Musicscraper
  extend Forwardable
  extend self

  def_delegators Musicscraper::Boomkat::RecommendedNew, :boomkat_all
  def_delegators Musicscraper::Fact::Mixes, :fact_list
  def_delegators Musicscraper::Pitchfork::BestNew,
    :pitchfork_all,
    :pitchfork_albums,
    :pitchfork_tracks,
    :pitchfork_reissues
end
