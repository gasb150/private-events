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
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
end
