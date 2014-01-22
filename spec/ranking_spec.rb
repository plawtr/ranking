require_relative "../ranking"

describe User do

	let(:user) {User.new}
	let(:activity) {Activity.new}

	it "should initialize with a minus 8 rank" do 
		expect(user.rank).to eq(-8) 
	end

	it "should initialize with 0 progress" do
		expect(user.progress).to eq(0)
	end

	it "should be able to increse progress value" do
		user.add_progress(1)
		expect(user.progress).to eq(1)
	end

	it "should increase rank once progress reaches 100" do
		user.add_progress(100)
		expect(user.rank).to eq(-7)
	end

	it "should spend progress increasing rank " do
		user.add_progress(105)
		expect(user.progress).to eq(5)
	end

	it "should not progress beyond rank 8" do
		17.times{user.add_progress(101)}
		expect(user.rank).to eq(8)
	end

	it "should skip rank zero" do
		7.times{user.add_progress(100)}
		user.add_progress(105)
		expect(user.rank).to eq(1)
	end

	it "should increment 3 progress if rank of user -8 and rank activity -8" do
		user.complete(activity)
		expect(user.progress).to eq(3)
	end


end

describe Activity do

	let(:activity) {Activity.new} 

	it "should initialize with a variable rank, default to -8" do
		expect(activity.rank).to eq(-8)
	end

	it "should be able to initiaize an activity with a rank" do
		expect(Activity.new(3).rank).to eq(3)
	end

	it "should be impossible to create an activity with rank -9" do
		expect{Activity.new(9)}.to raise_error(RuntimeError)
	end

end
