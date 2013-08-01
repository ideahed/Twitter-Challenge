
def current_user=(arg)
  session[id] = current_user
end 

def current_user
  @current_user ||= User.find_by_id(session[:user_id])
end 

def logged_in?
  !current_user.nil?
end

def logout
  session.clear
end
