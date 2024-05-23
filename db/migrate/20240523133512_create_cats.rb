# frozen_string_literal: true

class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name, required: true
      t.integer :age, required: true
      t.timestamps
    end
  end
end
