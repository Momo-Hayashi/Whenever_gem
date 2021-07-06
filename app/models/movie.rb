class Movie < ApplicationRecord
  enum status: {公開前:0, 公開中:1}

  #公開日（publish_at）が過ぎたら status を 0 から 1 に変更するメソッド publish_check
  def self.publish_check
    Movie.all.each do |movie|
      if movie.publish_at < Time.now
        movie.status = 1
        movie.save
      end
    end
  end
end
