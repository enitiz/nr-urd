class MyRegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"

	def new 
    @student = [ @member.student.build ]
    super
  end
  
end
