class AddSelectProjectPublicityPermission < ActiveRecord::Migration[5.2]
  def up
    Role.find_each do |r|
      r.add_permission!(:select_project_publicity) if r.permissions.include?(:edit_project)
    end
  end

  def down
    Role.find_each do |r|
      r.remove_permission!(:select_project_publicity)
    end
  end

  def run_in_request?; true end
end
