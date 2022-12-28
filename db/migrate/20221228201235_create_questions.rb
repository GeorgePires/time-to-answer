class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :description, null: false
      # Ex:- :null => false
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
