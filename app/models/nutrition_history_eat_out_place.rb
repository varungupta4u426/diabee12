class NutritionHistoryEatOutPlace < ApplicationRecord
  belongs_to :nutrition_history
  belongs_to :eat_out_place
end
