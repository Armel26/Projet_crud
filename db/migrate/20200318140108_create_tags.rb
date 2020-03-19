class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
    	t.text :content
      t.timestamps
    end
  end
end
