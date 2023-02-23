module ApplicationHelper
    def gravator_for(user,options ={ size: 100})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        image_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(image_url, alt: user.username, class: "img-fluid rounded mx-auto d-block")
    end
end
