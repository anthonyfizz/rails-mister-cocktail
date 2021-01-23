# frozen_string_literal: true

class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :doses, :descritpion, :description
  end
end
