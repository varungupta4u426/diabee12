class CreateEatOutPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :eat_out_places do |t|
      t.string :name

      t.timestamps
    end
  end
end
