module ProjectsHelper
	def profit?(profit)
		if profit
			"profitable"
		else
			"non profitable"
		end
	end
	def online?(online)
		if online
			"online"
		else
			"offline"
		end
	end
	def finished?(finished)
		if finished
			"finished"
		else
			"unfinished"
		end
	end
	def place?(place)
		if place != ""
			true
		else
			false
		end
	end
	def tag_split(line)
		line = line.split(",")
		return line
	end

end
