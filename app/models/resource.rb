class Resource < ActiveRecord::Base
  attr_accessible :project_id, :content, :content_html

  belongs_to :project

  auto_html_for :content do
  	html_escape
  	image
  	vimeo(width: 200, height: 125)
  	youtube(width: 200, height: 125)
  	google_map(width: 180, height: 135)
  	link target: "_blank", rel: "nofollow"
  	simple_format
  end

  private

end
