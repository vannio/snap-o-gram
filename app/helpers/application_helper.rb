module ApplicationHelper
  def author?(obj)
    obj.user == current_user
  end
end
