class NotesController < ApplicationController

	def index
		if current_user
			@note = current_user.note
			if @note == nil
				@note = Note.create(:user_id => current_user.id)
				redirect_to root_path
			end
		end
	end

	def update
		note = Note.find(params[:id])
		note.update_attributes(note_params)
		
		redirect_to root_path
	end

	private
		def note_params
			params.require(:note).permit(:id, :text)
		end

end
