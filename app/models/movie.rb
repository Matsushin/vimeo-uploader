class Movie < ActiveRecord::Base


  attr_accessor :video_uri

  before_create :save_video_id
  before_create :save_url

  def save_video_id
    self.video_id = video_uri_to_video_id
  end

  def save_url
    self.url = "#{Settings.vimeo.url}/#{video_id}"
  end

  private

  def video_uri_to_video_id
    #例) /videos/139669252
    video_uri.match(/[0-9]+$/)
  end
end
