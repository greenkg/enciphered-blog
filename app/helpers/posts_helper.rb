module PostsHelper

  def default_date(post)
    if post.published_on
      date ||= post.published_on
    else
      date ||= Date.today
    end
  end


end
