class AddRefToMovie < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :category, null: false, foreign_key: true
  end
end
