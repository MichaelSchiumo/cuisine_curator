class Meal < ApplicationRecord
  validates :rating, inclusion: { in: 1..10, message: 'Must be between 1 and 10' }
  # validates :difficulty, inclusion: { in: 0..6, message: 'Must be between 1 and 5' }
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :course, presence: true
  validates :notes, presence: true
  validates :name, uniqueness: true
  validates :prep_time, presence: true
  #validates :presence
  belongs_to :cuisine
  belongs_to :user
  # has_many :ingredients


  # scope :search_by_rating, -> (rating){where("rating = ?", rating)}
  # # scope :quickest_recipe, -> {joins(:meals).group('meals.id').order('COUNT("meals.meal_count") DESC')}
  # scope :for_dinner, -> {where(course: "Dinner") }

  # # scope :starts_with_s, -> {where(name: name.start_with?("s") )}


  # scope :starts_with_s, -> {where("name like ?", "S%")}


  # Account.where("email like ?", "%olitreadwell%")


  def self.sorted_by_rating
   self.all.sort do |meal1, meal2|
     meal2.rating <=> meal1.rating
   end
  end
end
