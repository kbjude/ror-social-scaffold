module UsersHelper
  def friendship_move
    if current_user != @user
      friend_request_button
    elsif current_user
      content_tag(:div, class: 'friendship-box') do
        concat(content_tag(:div, class: 'pending-requests') do
          concat(content_tag(:strong) do
            'Pending request'
          end)
          concat(tag(:br))
          concat(tag(:br))
          @friend_requests.each do |request|
            concat(content_tag(:strong) do
              link_to request.name.capitalize, user_path(request), class: 'friend-link'
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
            @user_friends.each do |f|
              concat(content_tag(:li) do
                       link_to f.name, user_path(f)
                     end)
            end
          end)
        end)
      end
    end
  end

  def friend_request_button(user)
    if current_user.friend?(user)
      button_to 'You are friends!', {}, { disabled: true }
    elsif current_user.pending_friends.include?(user)
      content_tag(:p) do
        button_to 'Awaits a response', {}, { disabled: true }
      end
    elsif current_user.friend_requests.include?(user)
      content_tag(:div, class: 'friend-request') do
        if concat(button_to('Confirm Request', confirm_user_friendship_path(id: current_user, user_id: user)))
          button_to 'send Request', {}, { disable: true }
        end
        concat(button_to('Decline Request', decline_user_friendship_path(id: current_user, user_id: user)))
      end
    else
      button_to 'send Request', user_friendships_path(user)
    end
  end

  def users_on_home
    @users.map do |user|
      content_tag(:li) do
        concat(content_tag(:strong) do
          "Name: #{user.name}"
        end)
        concat(content_tag(:span, class: 'profile-link') do
          concat(link_to('See your profile', user_path(user), class: 'profile-link')) if current_user == user
        end)
        if current_user != user
          concat(content_tag(:span, class: 'profile-link') do
            concat(friend_request_button(user))
          end)
        elsif confirm_user_friendship_path(id: current_user, user_id: user)
          button_to 'send Request', {}, { disable: true }
        end
      end
    end.join.html_safe
  end
end
