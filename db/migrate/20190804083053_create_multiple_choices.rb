class CreateMultipleChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :multiple_choices do |t|
      t.integer :question_id
      t.integer :order
      t.text :choice_content

      t.timestamps
    end
  end
end
