require_relative 'dat_reader'

class DataMunging
	def self.find_smallest_spread
		# get the data from the file
		data = get_data('weather.dat')
		day_with_smallest_spread = 0
		smallest_spread = 9999 # this spread could never exist, so we'll use it as an upper bound

		# we know that the data starts at line 3, so start there until the end
		results = []
		for i in 3..data.length - 2 # we want to cut out the month totals
			day = data[i][0]
			max_temp = data[i][1].to_f
			min_temp = data[i][2].to_f

			diff = max_temp - min_temp

			puts "day: #{day}   min: #{min_temp}   max: #{max_temp}   diff: #{diff}"

			if diff < smallest_spread
				day_with_smallest_spread = day
				smallest_spread = diff
			end
		end

		puts "--- Day with smallest spread: #{day_with_smallest_spread} with a spread of #{smallest_spread} degrees"
	end

	private

	def self.get_data(file_name)
		return DatReader.read_file(file_name)
	end
end
