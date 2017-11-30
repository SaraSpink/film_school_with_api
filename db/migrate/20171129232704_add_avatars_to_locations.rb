class AddAvatarsToLocations < ActiveRecord::Migration[5.1]
  def self.up
    change_table :locations do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :locations, :avatar
  end
end
