class CreateDseats < ActiveRecord::Migration[5.0]
  def change
    create_table :dseats do |t|
      t.string  :code
      t.boolean :area
      t.integer :oc_g
      t.integer :oc_w
      t.integer :a_g
      t.integer :a_w
      t.integer :b_g
      t.integer :b_w
      t.integer :c_g
      t.integer :c_w
      t.integer :d_g
      t.integer :d_w
      t.integer :e_g
      t.integer :e_w
      t.integer :f_g
      t.integer :f_w
      t.integer :g_g
      t.integer :g_w
      t.integer :t_g
      t.integer :t_w
      t.integer :tot

      t.timestamps
    end
  end
end
