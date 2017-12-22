class AddCountToBrightIdea < ActiveRecord::Migration
  def change
    add_column :bright_ideas, :likes_count, :integer
  end
end
