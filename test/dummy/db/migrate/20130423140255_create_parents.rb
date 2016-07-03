class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents, &:timestamps
  end
end
