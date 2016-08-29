class NutritionHistory < ApplicationRecord
  belongs_to :patient

  has_many :exercises , :inverse_of => :nutrition_history, dependent: :destroy
  accepts_nested_attributes_for :exercises, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  has_many :nutrition_history_eat_out_places
  has_many :eat_out_places, through: :nutrition_history_eat_out_places

  EATOUT_OPTIONS = ["Fast Food","Cafe","Buffets","Take Out","Fine Dinning"]
end
