module ApplicationHelper
	include AutoHtml

	#Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Funkalab"
		um = if unread_mail > 0 then "("+unread_mail.to_s+") " else "" end
		if page_title.empty?
			"#{um}#{base_title}"
		else
			"#{um}#{base_title} | #{page_title}"
		end
	end

	def logo
		image_tag("funkalab.png", alt: "Sample App", class: "round")
	end

	def unread_mail
		if signed_in?
			conversations = current_user.conversations + current_user.reverse_conversations
			um = 0
			for c in conversations do 
				if c.lines.first
					if c.lines.first.id
						if c.lines.first.user_id != current_user.id
							um=um+1
						end
					end
				end
			end
			um
		else
			0
		end
	end



	def embedded(content,size)
		w=85*size
		h=w*0.71
		auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
	end

end
