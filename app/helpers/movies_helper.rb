module MoviesHelper
  def vimeo_player_url(url)
    url.sub(/vimeo.com/,'player.vimeo.com/video')
  end
end
