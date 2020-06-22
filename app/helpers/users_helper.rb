module UserHelper
    def friendship_move
        if current_user !=@user
            request_button
        elsif current_user
            content_tag(:div, class: 'friendship-box') do
                concat(content_tag(:div, class: 'pending-requests') do
                    concat(content_tag(:strong) do
                        'Pending request'
                    end)
                    concat(tag(:br))
                    concat(tag(:br))
                    @friend_request.each do |f|
                        concat(content_tag(:strong) do 
                            link_to f.name.capitalize, user(f), class: 'friend-link'
                        end)
                    end
                end)
                concat(content_tag(:div, class: 'all-friends') do
                    concat(content_tag(:strong) do
                        'All Friends:'
                    end)
                    concat(tag(:br))
                    concat(tag(:br))
                    concat(content_tag(:ul) do
                        @friend.each do |f|
                            concat(content_tag(:li) do
                                link_to f.name, user_path(f)
                            end)
                        end
                    end)
                end)
            end
        end
    end
end