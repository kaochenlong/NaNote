class NotesController < ApplicationController
	def index
		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def create
		# Strong Parameter
		clean_note = params.require(:note).permit(:title, :content)
		@note = Note.new(clean_note)

		if @note.save
			redirect_to "/notes"
		else
			## 待處理
			render :new
		end
	end
end
