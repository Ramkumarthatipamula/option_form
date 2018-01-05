class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :certificate_no
      t.string :student_id
      t.string :student_name
      t.string :father_name
      t.string :mother_name
      t.string :aadhar_no
      t.string :academic_type
      t.string :degree_name
      t.string :college_name
      t.string :academic_year
      t.string :attachment
      t.timestamps
    end
  end
end
