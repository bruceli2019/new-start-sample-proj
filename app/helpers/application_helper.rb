module ApplicationHelper
    
    
    #returns full page title on a per-page basis
    #page_title default value is '', aka if full_title is not given an argument
    #the argument will be ''
    def full_title(page_title = '')
        base_title = "Ruby on Rails Tutorial Sample App"
        if page_title.empty?
            # if there is no page title, then we just return the base title
            return base_title
        else
            #string addition
            return page_title + " | " + base_title
        end
    end
    
end
