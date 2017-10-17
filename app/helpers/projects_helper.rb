module ProjectsHelper

  def project_status(finished)
    if finished
      "Completed"
    else
      "In Progress"
    end
  end

  def default_image(project)
    if project.image_file_name
      image_file_name ||= project.image_file_name
    else
      image_file_name ||= "project-blog.jpg"
    end
  end

end
