class SignInController < ApplicationController

	def new
		@user_session = UserSession.new
	end

	def create
	  debugger
    @user_session = UserSession.new(sign_in_params)

     respond_to do |format|
	     if @user_session.save
	        format.html { redirect_to @user_session, notice: 'Session was successfully created.' }
	        format.json { render :show, status: :created, location: @user_session }
	     else
	        format.html { render :new }
	        format.json { render json: @user_session.errors, status: :unprocessable_entity }
	     end
     end
	end

	def destroy
		@user_session.destroy
	end

	private

	def sign_in_params
		 params.require(:user_session).permit(:password, :email)
	end
end
