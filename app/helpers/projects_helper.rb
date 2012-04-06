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
	def num2cat(num)
		#num /= 100
		case num
		when 0..9
			categories[num]
		else
			"Other"
		end
	end
	def cat2num(cat) #Repetido en el controlador
		if cat = "Other"
			return 99
		else
			categories.find(cat)
		end
	end
	def tag_split(line)
		line = line.split(",")
		return line
	end

	def categories #Repetido en el controlador
		catalog = ["Art", "Technology", "Music", "Film", "Photography", "Dance", "Design", "Games", "Publishing", "Theater", "Other"] #0..9
		return catalog
	end

end
