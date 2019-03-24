module ApplicationHelper

  def follow_user_button(user)
    if current_user.follow?(user)
      # unfollow
    else
      link_to 'follow', follow_user_path(user.id), method: :post, class: "btn btn-link btn-follow"
    end
  end
end
