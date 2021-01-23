# frozen_string_literal: true

class AddReferencesLastToDoses < ActiveRecord::Migration[6.0]
  def change
    add_reference :doses, :cocktail, null: false, foreign_key: true
    add_reference :doses, :ingredient, null: false, foreign_key: true
  end
end
