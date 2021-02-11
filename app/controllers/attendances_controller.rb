class AttendancesController < ApplicationController
    def index
        @attendances = Attendance.all
      end
    
      # GET /events/1 or /events/1.json
      def show
        @attendances = Attendance.find(:id)
      end
    
      # GET /events/new
      def new
        @attendances = Attendance.new(attendances_params)
      end
    
      # GET /events/1/edit
      def edit
      end
    

  # POST /events or /events.json
  def create
    
    @attendances = Attendance.new(user_id: current_user.id, event_id: params[:event_id])
    
       if Attendance.find_by(event_id: params[:event_id]).nil?
        if @attendances.save
        redirect_to event_path(params[:event_id])
        end
        elsif current_user.id == Attendance.find_by(event_id: params[:event_id]).user_id
        render event_path(params[:event_id])
          flash.alert = "You are currently in this event"
        
        else
        if @attendances.save
        redirect_to event_path(params[:event_id])
       
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @attendances.update(attendances_params)
        format.html { redirect_to @attendances, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @attendances }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendances.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @attendances.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @attendances = Attendances.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendances_params
      # params.fetch(:event, {})
      params.require(:attendances).permit(:user_id, :event_id)
    end

end



