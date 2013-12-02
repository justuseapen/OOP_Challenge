require 'csv'
require 'pry'
require_relative 'assignment_grade.rb'
require_relative 'student.rb'

#GradeReader - an object that is responsible for reading in grade data from a CSV

class GradeReader
	def initialize(file_path)
		raise "#{file_path} does not exist" unless File.exists? file_path
		@file_path = file_path
	end

	def construct_students
		students = []
		CSV.foreach(@file_path, :headers => true) do |row|
			scores = []
			row["scores"].split.each do |score|
				score = AssignmentGrade.new(score)
				scores << score
			end
			student = Student.new(row["student_name"],scores)
			students << student
		end
		students
	end
end
