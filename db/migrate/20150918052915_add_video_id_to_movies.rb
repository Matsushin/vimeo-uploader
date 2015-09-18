class AddVideoIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :video_id, :string
  end
end
