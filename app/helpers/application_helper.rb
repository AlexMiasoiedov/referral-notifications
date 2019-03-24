module ApplicationHelper

  def follow_user_button(user)
    if current_user.follow?(user)
      link_to 'unfollow', unfollow_user_path(user.id), method: :post, class: "btn btn-outline-danger btn-unfollow"
    else
      link_to 'follow', follow_user_path(user.id), method: :post, class: "btn btn-outline-info btn-follow"
    end
  end
end
