class CreateMurmurs < ActiveRecord::Migration[5.1]
  def change
    create_table :murmurs do |t|
      t.text :content

      t.timestamps
    end
  end
end
