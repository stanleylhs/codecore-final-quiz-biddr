class AddAasmstateToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :aasm_state, :string
  end
end
