require_relative "../ranking"

describe User do 

		it "should initialize with a minus 8 rank" do 
		 expect(User.new.rank).to eq(-8) 
		end

end
