class ModifyName < ActiveRecord::Migration
  def change
  	rename_column :employees, :employe_name, :employee_name
  end
end
