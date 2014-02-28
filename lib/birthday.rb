#################################
### B I R T H D A Y   R U B Y ###
#################################
require 'date'
require 'time'

class Birthday
	attr_accessor :time, :birthday, :this_year, :bd_yyyy

	def initialize(bd_mm_dd_yyyy) # for instance: Birthday.new("12/19/2014")
		date = true
		if bd_mm_dd_yyyy == ""
			@birthday = false
			date = false
		end
		if date
			@time = Time.new.strftime("%Y%m%d")	# today this will return date in "20131218" format
			
			# year, both this on and next one
			@this_year = @time[0..3]	# gets today's year ("2013")
			i_year = @this_year.to_i	# gets next year part 1/3
			year = i_year + 1	        # gets next year part 2/3
			next_year = year.to_s	    # gets next year part 3/3 ("2014")

			# current month and day
			this_month = @time[4..5]		# gets today's month ("12")
			this_day = @time[-2..-1]		# gets today's day ("23")

			# birthday year, month, and day
			@bd_yyyy = bd_mm_dd_yyyy[-4..-1] # gets birthday year ("1944")
			bd_mm = bd_mm_dd_yyyy[0..1]	     # gets birthday month ("12")
			bd_dd = bd_mm_dd_yyyy[3..4]		   # gets birthday day ("28")
			bd_mmdd = bd_mm + bd_dd          # preps the month and day of bd for the year

			if bd_mm > this_month
				birthday_var = bd_mmdd.insert(0, this_year)
			elsif bd_mm == this_month				
				if  bd_dd >= this_day
					birthday_var = bd_mmdd.insert(0, this_year)
				else									
					birthday_var = bd_mmdd.insert(0, next_year)
				end
			else # bd_mm < this_month
				birthday_var = bd_mmdd.insert(0, next_year)
			end
			##########################################################################
			@birthday = birthday_var # Birthday.new("19890618")[@birthday] => "20140618"
		end
	end

	def birthday?
		if birthday != false
			if time == birthday
				return "Your birthday is today. Happy birthday!"
			else
				t = Date.parse(time)
				b = Date.parse(birthday)
				wait_1 = (t.mjd - b.mjd).abs 	# mjd makes it an integer, abs is absolute value
				wait_2 = (b.mjd - t.mjd).abs
				if wait_1 <= wait_2
					if wait_1 > 1
						"Your birthday is in #{wait_1} days."
					else
						"Your birthday is tomorrow!"
					end
				else
					if wait_2 > 1
						"Your birthday is in #{wait_1} days."
					else
						"Your birthday is tomorrow!"
					end
				end
			end
		else
			"I don't know when your birthday is."
		end
	end

	def age?
		if birthday != false
			bd = birthday[0..3]
			if bd == this_year
				age = this_year.to_i - bd_yyyy.to_i
			else
				age = this_year.to_i - bd_yyyy.to_i + 1
			end
			if age > 1
				"You will be #{age} years old."
			else
				"You will be born."
			end
		else
			"I don't know how old you will be."
		end
	end

end
