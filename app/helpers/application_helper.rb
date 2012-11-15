module ApplicationHelper
  def avatar_url(user,size)
    if size == 80
      default_url = "#{root_url}unknown_person_80.jpg"
    else
      default_url = "#{root_url}unknown_person.png"    
    end
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
  end 
end
