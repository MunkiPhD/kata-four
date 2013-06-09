require_relative 'dat_reader'

class DataMunging
	def self.find_smallest_spread_soccer
		data = get_data('football.dat')
		team_with_smallest_spread = nil
		smallest_spread = 9999 # cant have this big of a spread, so set it really high

		results = []

		for i in 3..data.length - 2
			unless data[i][1].nil? # get rid of the row of all lines. it's parsed into the first location, so check to see if the second location of the array is empty
				team = data[i][1]
				wins = data[i][6].to_f
				losses = data[i][8].to_f
				difference = (wins - losses).abs # get the absolute value so that we have the difference

				if difference < smallest_spread
					results = []
					results << [team, wins, losses, difference]
					smallest_spread = difference
				elsif difference == smallest_spread # going to check for equality in order to deal with ties
					results << data[i]
				end
			end
		end

		puts "Smallest Spread Results: "
		results.each { |item|
			puts "#{item[0]} W:#{item[1]} L:#{item[2]}   Difference: #{item[3]}"
		}
	end


	def self.find_smallest_spread_weather
		# get the data from the file
		data = get_data('weather.dat')
		day_with_smallest_spread = 0
		smallest_spread = 9999 # this spread could never exist, so we'll use it as an upper bound

		# we know that the data starts at line 3, so start there until the end
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
