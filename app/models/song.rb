class Song < ActiveRecord::Base
  validates :title, presence:true, uniqueness: true
  validates :release_year, presence: true, if: "released == true"
  validates :artist_name, presence: true
  validate :less_than_or_equal_current_year

  private
  def less_than_or_equal_current_year
    if release_year.to_i > Time.new.year
      errors.add(:released_year, "Year not valid")
    end
  end
end
