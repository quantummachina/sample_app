class Inspiration < ActiveRecord::Base
  attr_accessible :user_id, :content, :content_html

  belongs_to :user

  auto_html_for :content do
  	html_escape
  	image
  	vimeo(width: 190, height: 125)
  	youtube(width: 190, height: 125)
  	google_map(width: 190, height: 135)
  	soundcloud(width: 190, height: 135)
  	link target: "_blank", rel: "nofollow"
  	simple_format
  end

  private

end
