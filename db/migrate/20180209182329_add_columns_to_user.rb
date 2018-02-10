class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :academic_program, :string
    add_column :users, :degree_name, :string
    add_column :users, :college_name, :string
    add_column :users, :admission_year, :string
  end
end
