module ApplicationHelper
	
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Project URD"
    page_title = truncate(page_title, length: 40)
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
