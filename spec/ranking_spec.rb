require_relative "../ranking"

describe User do

	let(:user) {User.new}

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


end

describe Activity do

	it "should initialize with a variable rank, default to -8" do
		expect(Activity.new.rank).to eq(-8)
	end

end
