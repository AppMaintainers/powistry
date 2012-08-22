module ApplicationHelper
  def avatar_url(user,size)
    default_url = "#{root_url}unknown_person.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
  end
end
