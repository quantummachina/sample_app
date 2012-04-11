class Resource < ActiveRecord::Base
  attr_accessible :project_id, :content, :content_html

  belongs_to :project

  auto_html_for :content do
  	html_escape
  	image
  	youtube(width: 400, height: 250)
  	link target: "_blank", rel: "nofollow"
  	simple_format
  end
  
end
