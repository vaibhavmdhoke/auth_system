class UserSessionsController < ApplicationController
  before_action :set_user_session, only: [:show, :edit, :update, :destroy]

  # GET /user_sessions
  # GET /user_sessions.json
  def index
    @user_sessions = UserSession.all
  end

  # GET /user_sessions/1
  # GET /user_sessions/1.json
  def show
  end

  # GET /user_sessions/new
  def new
    @user_session = UserSession.new
  end

  # GET /user_sessions/1/edit
  def edit
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(user_session_params)

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to @user_session, notice: 'User session was successfully created.' }
        format.json { render :show, status: :created, location: @user_session }
      else
        format.html { render :new }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_sessions/1
  # PATCH/PUT /user_sessions/1.json
  def update
    respond_to do |format|
      if @user_session.update(user_session_params)
        format.html { redirect_to @user_session, notice: 'User session was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_session }
      else
        format.html { render :edit }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User has successfully logged out.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_session
    user = authenticated?
    @user_session = user.user_session
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_session_params
    params.require(:user_session).permit(:expires_at, :user_id)
  end


end
