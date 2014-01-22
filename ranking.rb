
class User 
	attr_accessor :rank, :progress
	RANK = [-8,-7,-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8]
	SCORES = {0 => 3, 1 => 1}

	def initialize
		@rank, @progress = RANK[0], 0	
	end

	def inc_progress activity_rank
		raise "Activity Rank out of range value" unless RANK.include?(activity_rank)
		self.progress = 0 if self.rank == 8 
		diff = RANK.index(self.rank)-RANK.index(activity_rank)

		if SCORES.include?(diff) 
			self.add_progress(SCORES[diff])
		elsif diff < 0 
			self.add_progress(10 * diff * diff)
		else
			return
		end
	end

	def add_progress progress_points
		self.progress += progress_points 
		while self.progress >= 100 do 
			add_rank
			self.progress-=100
		end
		self.progress = 0 if self.rank == 8
 	end

	def add_rank	 
		self.rank = RANK[(RANK.index(self.rank))+1] if self.rank < 8
	end
end