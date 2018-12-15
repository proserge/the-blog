module BlogsHelper
 
  def user_has_blog?
    user_signed_in? and current_user.blog
  end
     
end
