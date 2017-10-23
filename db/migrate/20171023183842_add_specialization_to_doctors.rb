class AddSpecializationToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :specialization, :string
  end
end
