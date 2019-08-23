class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.text :title
      t.integer :total_count
      t.text :link

      t.timestamps
    end
  end
end
