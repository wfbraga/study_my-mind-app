class ChangTagNameRequired < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tags, :name, false
  end
end
