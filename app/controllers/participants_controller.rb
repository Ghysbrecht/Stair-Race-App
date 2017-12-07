class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  helper_method :current_user
  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    if current_admin.nil?
      redirect_to '/login'
    else
      @participant = Participant.new
    end
  end

  # GET /participants/1/edit
  def edit
    if current_admin.nil?
      redirect_to '/login'
    end
  end

  # POST /participants
  # POST /participants.json
  def create
    if current_admin.nil?
      redirect_to '/login'
    else
      @participant = Participant.new(participant_params)

      respond_to do |format|
        if @participant.save
          format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
          format.json { render :show, status: :created, location: @participant }
        else
          format.html { render :new }
          format.json { render json: @participant.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    if current_admin.nil?
      redirect_to '/login'
    else
      respond_to do |format|
        if @participant.update(participant_params)
          format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
          format.json { render :show, status: :ok, location: @participant }
        else
          format.html { render :edit }
          format.json { render json: @participant.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    if current_admin.nil?
      redirect_to '/login'
    else
      @participant.destroy
      respond_to do |format|
        format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end


  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  #hide_action :current_admin

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:name, :uid)
    end

    def authenticate_user!
      redirect_to '/login' if current_admin.nil?
    end



    def current_admin
      @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end
  end

