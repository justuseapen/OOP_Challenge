require './grade_reader'
require 'pry'

#FinalGrade - an object that encapsulates the concept of a student's final grade

class FinalGrade
	# def initialize(fgrade)
	# 	@final_grade = grade
	# end

	def average(student)
		sum = 0
		scores = student.scores
		scores.each { |score| sum += score}
		average = sum / scores.length
	end

	def finalize_grade(student)
		average = average(student)
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


end
