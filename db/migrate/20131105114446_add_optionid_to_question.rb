class AddOptionidToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :options, index: true
  end
end
