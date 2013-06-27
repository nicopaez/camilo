migration 2, :create_events do
  up do
    create_table :events do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :date, Date
      column :slug, String, :length => 255
      column :short_url, String, :length => 255
      column :account_id, Integer
    end
  end

  down do
    drop_table :events
  end
end
