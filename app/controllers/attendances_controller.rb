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
        @attendances = Attendance.new
      end
    
      # GET /events/1/edit
      def edit
      end
    

  # POST /events or /events.json
  def create
    @attendances = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendances.save
        format.html { redirect_to @attendances, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @attendances }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendances.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def attendance_params
    params.require(:attendance).permit(:event_id, :user_id).merge(user_id: current_user.id)
  end
end
