class CreateResponsers < ActiveRecord::Migration[5.2]
  def change
    create_table :responsers do |t|
      t.integer :survey_id
      t.string :nickname
      t.string :password

      t.timestamps
    end
  end
end
