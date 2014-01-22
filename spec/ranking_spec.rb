require_relative "../ranking"

describe User do

	let(:user) {User.new}
	#let(:activity) {Activity.new}

	it "should initialize with a minus 8 rank" do 
		expect(user.rank).to eq(-8) 
	end

	it "should initialize with 0 progress" do
		expect(user.progress).to eq(0)
	end

	it "should throw an arror if try to increase by non-existing rank " do 
		expect{user.inc_progress(-9)}.to raise_error(RuntimeError)
		expect{user.inc_progress(9)}.to raise_error(RuntimeError)
	end

 	it "should be able to increse progress value" do
 		user.inc_progress(-7)
 		expect(user.progress).to eq(10)
 	end

	it "should increase rank once progress reaches 100" do
		user.inc_progress(-7)
		user.inc_progress(-5)
		expect(user.rank).to eq(-7)
		expect(user.progress).to eq(0) 
	end

	it "should take a user ranked -8 takes activity ranked -4 -> receives 160 progress, rank -7 and having earned 60 progress towards next rank" do
		user.inc_progress(-4)
		expect(user.rank).to eq(-7)
		expect(user.progress).to eq(60) 
	end

	it "should take a user ranked -8 takes activity ranked -3 -> receives 250 progress, rank -6 and having earned 50 progress towards next rank" do
		user.inc_progress(-3)
		expect(user.rank).to eq(-6)
		expect(user.progress).to eq(50) 
	end

	it "should take a user ranked -8 takes activity ranked -2 -> receives 360 progress, rank -5 and having earned 60 progress towards next rank" do
		user.inc_progress(-2)
		expect(user.rank).to eq(-5)
		expect(user.progress).to eq(60) 
	end

	it "should take a user ranked -8 takes activity ranked 1 -> receives 640 progress, rank -2 and having earned 40 progress towards next rank" do
		user.inc_progress(1)
		expect(user.rank).to eq(-2)
		expect(user.progress).to eq(40) 
	end

	it "should take a user ranked -8 takes activity ranked 2 -> receives 810 progress, rank 1 and having earned 10 progress towards next rank" do
		user.inc_progress(2)
		expect(user.rank).to eq(1)
		expect(user.progress).to eq(10) 
	end

	it "should take a user ranked -8 takes activity ranked 3 -> receives 1000 progress, rank 3 and having earned 0 progress towards next rank" do
		user.inc_progress(3)
		expect(user.progress).to eq(0) 
		expect(user.rank).to eq(3)
	end

	it "should take a user ranked -8 takes activity ranked 4 -> receives 1210 progress, rank 5 and having earned 10 progress towards next rank" do
		user.inc_progress(4)
		expect(user.progress).to eq(10) 
		expect(user.rank).to eq(5)
	end

	it "should take a user ranked -8 takes activity ranked 5 -> receives 1440 progress, rank 7 and having earned 40 progress towards next rank" do
		user.inc_progress(5)
		expect(user.progress).to eq(40) 
		expect(user.rank).to eq(7)
	end

	it "should take a user ranked -8 takes activity ranked 6 -> receives 1690 progress, rank 8 and having earned 90 progress towards next rank" do
		user.inc_progress(6)
		expect(user.progress).to eq(0) 
		expect(user.rank).to eq(8)
	end


	it "should increment 3 progress if rank of user -8 and rank activity -8" do
		user.inc_progress(-8)
		expect(user.progress).to eq(3)
	end

	it "should increment 1 progress if rank of user -7 and rank activity -8" do
		user.inc_progress(-7)
		user.inc_progress(-5)
		expect(user.rank).to eq(-7)
		a = user.progress
		user.inc_progress(-8)
		b = user.progress
		expect(b-a).to eq(1)
	end

	it "should increment 0 progress if rank of user -6 and rank activity -8" do
		user.inc_progress(-3)
		expect(user.rank).to eq(-6)
		a = user.progress
		user.inc_progress(-8)
		b = user.progress
		expect(a).to eq(b)
	end

	it "should increment 90 progress if rank of user -8 and rank activity -5" do
		
		user.inc_progress(-5)
		expect(user.progress).to eq(90)
	end

	it "should increment 160 progress, if rank of user -8 and rank activity -4, i.e. new rank -7 and 60 progress" do
		user.inc_progress(-4)
		expect(user.progress).to eq(60)
		expect(user.rank).to eq(-7)
	end

	it "should check small progress raises rank" do
		user.inc_progress(-5)
		user.inc_progress(-5)
		expect(user.rank).to eq(-7)
		expect(user.progress).to eq(80)
	end

	it "should for user of -1 rank completing activity ranking +1, increment progress by 10." do
		user.inc_progress(1)
		expect(user.rank).to eq(-2)
		expect(user.progress).to eq(40)
		user.inc_progress(2) 
		expect(user.rank).to eq(-1)
		expect(user.progress).to eq(30)
		user.inc_progress(1)
		expect(user.progress).to eq(40)
	end

	it "should for user of 1 completing activity ranking -1, have rank of 1." do
		user.inc_progress(2)
		expect(user.rank).to eq(1)
		expect(user.progress).to eq(10) 
		user.inc_progress(-1)
		expect(user.rank).to eq(1)
	end


end

# describe Activity do

# 	let(:activity) {Activity.new} 

# 	it "should initialize with a variable rank, default to -8" do
# 		expect(activity.rank).to eq(-8)
# 	end

# 	it "should be able to initiaize an activity with a rank" do
# 		expect(Activity.new(3).rank).to eq(3)
# 	end

# 	it "should be impossible to create an activity with rank -9" do
# 		expect{Activity.new(9)}.to raise_error(RuntimeError)
# 	end

# end
