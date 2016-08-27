class EatOutPlace < ApplicationRecord


  has_many :nutrition_history_eat_out_places
  has_many :nutrition_histories, through: :nutrition_history_eat_out_places


end
