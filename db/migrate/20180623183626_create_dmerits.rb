class CreateDmerits < ActiveRecord::Migration[5.0]
  def change
    create_table :dmerits do |t|
      t.string   :applicant_name
      t.string   :application_number
      t.string   :caste
      t.string   :gender
      t.string   :ht_number
      t.text     :subjects
      t.float    :c_cgpa_r
      t.integer  :f_rank
      t.string   :father_name
      t.string   :mother_name
      t.string   :mobile_number
      t.text     :special
      t.boolean  :area

      t.timestamps
    end
  end
end
