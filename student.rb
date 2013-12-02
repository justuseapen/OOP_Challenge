class Student
	def initialize(name,grades)
		@name = name
		@grades = grades
	end

	def name
		@name
	end

	def grades
		@grades
	end

	def average
		sum = 0
		grades.each { |grade| sum += grade.score }
		sum / grades.length
	end

	def final_grade
		if average >= 90
			grade = 'A'
		elsif average >= 80
			grade = 'B'
		elsif average >= 70
			grade = 'C'
		elsif average >= 60
			grade = 'D'
		else
			grade = 'E'
		end
	end

	def display_status
		"#{name} has a #{final_grade} with an average of #{average}"
	end

end