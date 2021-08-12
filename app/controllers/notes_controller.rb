class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :update, :destroy]

	def index
		@notes = Note.order(id: :desc)
	end

	def show
	end

	def edit
	end

	def update
		if @note.update(note_params)
			redirect_to "/notes"
		else
			## 待處理
			render :edit
		end
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)

		if @note.save
			redirect_to "/notes"
		else
			## 待處理
			render :new
		end
	end

	def destroy
		@note.destroy
		redirect_to "/notes"
	end

	private
	# Strong Parameter
	def note_params
		params.require(:note).permit(:title, :content)
	end

	def find_note
		@note = Note.find(params[:id])
	end
end
