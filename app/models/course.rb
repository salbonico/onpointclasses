class Course < ActiveRecord::Base
has_many :enrollments
has_many :users, through: :enrollments
belongs_to :teacher
accepts_nested_attributes_for :teacher
validates :name, presence: true
validates :teacher_id, presence: true
validates :description, presence: true
validates :description, length: { minimum: 10 }
validates :description, length: { maximum: 500 }
validates :name, uniqueness: true

def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end


end