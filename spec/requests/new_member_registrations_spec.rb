require 'spec_helper'

describe "New Member Registrations" do

	subject { page }
	
	describe "Sign up" do
			before { visit new_member_registration_path }
			
			it { should have_selector('title', text:'Sign up') }
			it { should have_content('Project URD') }
			it { should have_selector('h6', text:'Sign up') }
			it { should have_selector('a', text:'As a Student') }
			it { should have_selector('a', text:'As a Faculty / Administrator') }
   end
end

describe Member do

	before do
		@member = Member.new(name: "Example User",
													 email: "user@example.com",
													 password: "exampleuser",
													 password_confirmation: "exampleuser",
													 joined_on: "2009",
													 department_id: "8",
														)
	end
	
	subject{ @member }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:joined_on) }
	it { should respond_to(:department_id) }
	it { should be_valid }
	
	# Checking for presence
	
	describe "when name is not present" do
			before { @member.name = " " }
			it { should_not be_valid }
	end
	
	describe "when email is not present" do
			before { @member.email = " " }
			it { should_not be_valid }
	end
	
	describe "when password is not present" do
			before { @member.password = @member.password_confirmation = " " }
			it { should_not be_valid }
	end
	
	describe "when passwords don't match" do
			before { @member.password_confirmation = "mismatch" }
			it { should_not be_valid }
	end
	
	describe "when joined_on is not present" do
			before { @member.joined_on = " " }
			it { should_not be_valid }
	end
	
	describe "when department_id is not present" do
			before { @member.department_id = nil }
			it { should_not be_valid }
	end

	# Limits testing
	
	describe "when joined_on is less than 1992" do
			before { @member.joined_on = "1991" }
			it { should_not be_valid }
	end
	
	describe "when joined_on is greater than 2020" do
			before { @member.joined_on = "2021" }
			it { should_not be_valid }
	end
	
	describe "when department_id is less than 1" do
			before {	@member.department_id = 0 }
			it { should_not be_valid }
	end
	
	describe "when department_id is greater than 20" do
			before {	@member.department_id = 21 }
			it { should_not be_valid }
	end
	
	# Length testing
	
	describe "when name is less than 5 letters" do
			before { @member.name = "hary" }
			it { should_not be_valid }
	end
	
	describe "when name is more than 30 letters" do
			before { @member.name = 'a'*31 }
			it { should_not be_valid }
	end
	
end	
