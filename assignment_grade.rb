class AssignmentGrade
	def initialize (score)
		@score = score.to_i
	end

	def score
		@score
	end

	def all
		all_scores = []
		ObjectSpace.each_object(AssignmentGrade) do |score|
			all_scores << score
		end
		all_scores
	end

	def average
		sum = 0
		all.each { |score| sum += score }
		sum / all.length
	end

end