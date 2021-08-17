class NotesController < ApplicationController
	before_action :find_user_note, only: [:show, :edit, :update, :destroy]
	before_action :check_login!, except: [:index, :show]

	def index
		@notes = current_user.notes
		                     .includes(:user)
												 .order(id: :desc)
	end

	def show
		# @comment = Comment.new(note_id: @note.id)
		@comment = @note.comments.new
		@comments = @note.comments.order(id: :desc)
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
		@note = current_user.notes.new
	end

	def create
		@note = current_user.notes.new(note_params)

		if @note.save
			redirect_to "/notes"
		else
			## 待處理
			render :new
		end
	end

	def destroy
		# @note.destroy
		@note.update(deleted_at: Time.now)
		redirect_to "/notes"
	end

	private
	# Strong Parameter
	def note_params
		params.require(:note).permit(:title, :content)
	end

	def find_user_note
		# @note = Note.find(params[:id])
		# @note = Note.find_by(id: params[:id], user_id: current_user.id)
		@note = current_user.notes.find(params[:id])
	end
end
