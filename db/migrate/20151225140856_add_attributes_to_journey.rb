class AddAttributesToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :title, :string
    add_column :journeys, :description, :text
    add_column :journeys, :blog, :string
    add_column :journeys, :facebook, :string
    add_column :journeys, :twitter, :string
  end
end
