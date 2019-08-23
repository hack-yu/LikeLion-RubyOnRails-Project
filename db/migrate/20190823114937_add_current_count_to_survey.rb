class AddCurrentCountToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :current_count, :integer, default: 0
  end
end
