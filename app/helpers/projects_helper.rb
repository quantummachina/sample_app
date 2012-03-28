module ProjectsHelper
	@set_name = "12321"

	def set_name=(file_name)
		@set_name = file_name
	end

	def set_name
		#existe o ""
		#@set_name = "Macaco"
		#project.cover = @set_name
		project[:cover] = "gagaga"
	end

end
