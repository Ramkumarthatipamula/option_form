class CreateAllotments < ActiveRecord::Migration[5.0]
  def change
    create_table :allotments do |t|
      t.string  :student_name
      t.string  :gender
      t.integer :rank
      t.string  :college_name
      t.boolean :area
      t.string  :category
      t.string  :allotment
      t.string  :s_allotment
      t.string  :s_allotment
      t.string  :shifted_college

      t.timestamps
    end
  end
end
