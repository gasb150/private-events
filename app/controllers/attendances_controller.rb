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
    
end
