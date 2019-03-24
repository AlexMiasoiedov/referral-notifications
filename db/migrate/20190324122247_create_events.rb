class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :eventable_id
      t.string  :eventable_type
      t.string  :action
      t.jsonb   :data, default: '{}'

      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, [:eventable_id, :eventable_type]
    add_index :events, :action
    add_index :events, :data, using: :gin
  end
end
