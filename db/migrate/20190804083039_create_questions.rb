class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.integer :survey_type
      t.integer :order, default: 0
      t.boolean :required
      t.integer :allow_id
      t.text :question_content
      t.text :question_subcontent
      t.string :image

      t.timestamps
    end
  end
end
