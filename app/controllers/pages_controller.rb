class PagesController < ApplicationController
    
    def landingpage
        if logged_in?
            redirect_to articles_path
        end
    end

    def aboutus
    end
    
end
 