class DatReader
	def self.read_file(file_name)
		file = File.new(file_name, "r")
		in_pre = false
		data = []

		while (line = file.gets)
			split_line = line.split # initial split of the line to get the different values

			# check if its the closing tag before so we dont load the tag in the array
			if split_line[0] == '</pre>'
				in_pre = false
			end

			# if the split line is not empty and we're in the <pre> tag, we want to add the data to the array
			if split_line.any? && in_pre # make sure that the array isn't empty
				data << split_line
			end

			# check if it's <pre> afterwards so we dont get the tag in the array
			if split_line[0] == '<pre>'
				in_pre = true
			end
		end

		data
	end
end
