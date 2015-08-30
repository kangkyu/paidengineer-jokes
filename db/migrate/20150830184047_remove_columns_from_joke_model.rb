class RemoveColumnsFromJokeModel < ActiveRecord::Migration
  def change
    remove_column :jokes, :title
    remove_column :jokes, :author
  end
end
