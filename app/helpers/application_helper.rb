module ApplicationHelper
  def bootstrap_class_for(name)
    { success: "alert-success",
      error: "alert-danger",
      danger: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info",
    }[name.to_sym] || name
  end

  def owner?(object)
    current_user == object.user 
  end
  
end
