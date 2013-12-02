require_relative "grade_reader.rb"
require_relative "final_grade.rb"
require_relative "assignment_grade.rb"
require 'pry'

def prompt(query)
	puts query
	gets.chomp
end

filename = prompt "Where are your grades located (insert file name)?"
data = GradeReader.new(filename)
students = data.construct_students

name = prompt "Whose average would you like to check?"
unless name == "n"
	student = students.find do |student|
		student.name == name
	end
	puts student.display_status
end

log_response = prompt "Would you like to log the class grades to a file?"
if log_response == "Yes" || log_response.upcase == "Y"
	students.each do |s| 
	  CSV.open("final_grades.csv", 'a') do |row|
	    row << [s.display_status] 
	  end
  end
end

view_analytics = prompt "Would you like to see the class analytics?"

all_scores = []
ObjectSpace.each_object(AssignmentGrade) do |grade|
	all_scores << grade.score
end

sum = 0
all_scores.each { |score| sum += score }
average = sum / all_scores.length

min = all_scores.minmax.first
max = all_scores.minmax.last

deviations = []
all_scores.each do |score|
	deviation = score-average
	deviations << deviation
end

sum = 0

deviations.each do |d|
	sum += d**2
end

variance = sum / deviations.length
standard_deviation = Math.sqrt(variance)

puts "The class average is #{average}"
puts "The class minimum is #{min}"
puts "The class maximum is #{max}"
puts "The class standard deviation is #{standard_deviation}"




