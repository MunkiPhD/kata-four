require_relative 'dat_reader'

class DataMunging
	#
	# Finds the smallest spread in the soccer scores
	#
	def self.find_smallest_spread_soccer
		data = get_data('football.dat')

		results = smallest_spread(data, 1, 6, 8)

		puts "Smallest Spread Results: "
		results.each { |item|
			puts "#{item[0]} W:#{item[1]} L:#{item[2]}   Difference: #{item[3]}"
		}
	end

	#
	# Finds the smallest spread in temperature from the specified file
	#
	def self.find_smallest_spread_weather
		# get the data from the file
		data = get_data('weather.dat')

		results = smallest_spread(data, 0, 1, 2)
		#puts "--- Day with smallest spread: #{day_with_smallest_spread} with a spread of #{smallest_spread} degrees"
		puts "Smallest Spread Results: "
		results.each { |item|
			puts "Day: #{item[0]} High:#{item[1]} Low:#{item[2]}   Difference: #{item[3]}"
		}
	end

	private

	#
	# Gets an array of the data from the specified file
	#
	def self.get_data(file_name)
		return DatReader.read_file(file_name)
	end


	#
	# Returns a result array with the name, the maximum, minimum, and difference of the data with the smallest spread
	#
	def self.smallest_spread(data, name_col, max_col, min_col)
		smallest_spread = 9999 # cant have this big of a spread, so set it really high
		results = []

		for i in 3..data.length - 2
			unless data[i][1].nil? # get rid of the row of all lines. it's parsed into the first location, so check to see if the second location of the array is empty
				name = data[i][name_col]
				max = data[i][max_col].to_f
				min = data[i][min_col].to_f
				difference = (max-min).abs # get the absolute value so that we have the difference (the min might not necessarily be less than the max)

				if difference < smallest_spread
					results = []
					results << [name, max, min, difference]
					smallest_spread = difference
				elsif difference == smallest_spread # going to check for equality in order to deal with ties
					results << data[i]
				end
			end
		end

		results
	end
end
