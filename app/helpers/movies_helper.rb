module MoviesHelper
  def vimeo_player_url(url)
    url.sub(/vimeo/,'player.vimeo')
  end
end
