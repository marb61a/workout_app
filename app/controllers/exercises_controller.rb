class ExercisesController < ApplicationController
    def index
        
    end
    
    def new
        @exercise = current_user.exercises.new(exercise_params)
    end
    
    def create
        
    end
    
    def edit
    
    end
    
end