class NotesController < ApplicationController

    def index 
        notes = Note.all
        render json: notes
    end

    def show
        note = Note.find(params[:id])
        render json: note
    end

  
    def create
        note = Note.create(note_params)
        
        render json: note        

        # if note.valid?
        #     note.save
        #     render json: note
        # else
        #     render json: note.errors.full_messages
        #     # render json: "Not accepted"
        # end
        
    end

    def update
        note = Note.find(params[:id])
        note.update(note_params)
        
        render json: note
        # .update = .assign_attributes + .save
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy

        render json: "note deleted"
    end
    
    private

    def note_params
        params.require(:note).permit(:title, :content, :user_id)
    end

end