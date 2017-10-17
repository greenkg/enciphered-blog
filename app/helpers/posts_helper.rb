module PostsHelper

  def default_date(post)
    if post.published_on
      date ||= post.published_on
    else
      date ||= Date.today
    end
  end

  def default_image(post)
    if post.image_file_name
      image_file_name ||= post.image_file_name
    else
      image_file_name ||= "bird.jpg"
    end
  end


end
