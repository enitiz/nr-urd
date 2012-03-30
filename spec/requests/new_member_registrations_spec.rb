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

describe Student do

	before do
		@student = Member.new(name: "Example User",
													 email: "user@example.com",
													 password: "exampleuser",
													 joined_on: "2009",
													 department_id: "8"
														)
	end
	
	subject{ @student }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should be_valid }
	
	describe "when name is not present" do
			before { @student.name = " " }
			it { should_not be_valid }
	end
	
	describe "when email is not present" do
			before { @student.email = " " }
			it { should_not be_valid }
	end
	
	describe "when password is not present" do
			before { @student.password = " " }
			it { should_not be_valid }
	end
	
	describe "when joined_on is not present" do
			before { @student.joined_on = " " }
			it { should_not be_valid }
	end
	
	describe "when department_id is not present" do
			before { @student.department_id = nil }
			it { should_not be_valid }
	end
end	
