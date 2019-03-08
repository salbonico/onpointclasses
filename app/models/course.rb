class Course < ActiveRecord::Base
has_many :enrollments
has_many :users, through: :enrollments
belongs_to :teacher
accepts_nested_attributes_for :teachers

def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end


end