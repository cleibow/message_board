class AddDefaultToBrightIdea < ActiveRecord::Migration
  def change
    change_column :bright_ideas, :likes_count, :integer, :default => 0
  end
end
