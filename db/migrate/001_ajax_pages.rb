class AjaxPages < ActiveRecord::Migration
  def self.up
    create_table :ajax_pages do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :ajax_pages
  end
end