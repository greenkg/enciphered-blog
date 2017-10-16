module ProjectsHelper

  def project_status(finished)
    if finished
      "Completed"
    else
      "In Progress"
    end
  end

end
