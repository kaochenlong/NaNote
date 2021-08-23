class NotesController < ApplicationController
	before_action :find_user_note, only: [:edit, :update, :destroy, :publish]
	before_action :check_login!, except: [:index, :show]

	def index
		@notes = Note.includes(:user).order(id: :desc)
	end

	def show
		@note = Note.find(params[:id])
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

	def publish
		@note.publish!
		# flash[:notice] = "更新成功"
		# redirect_to notes_path
		redirect_to notes_path, notice: "更新成功"
	end

	private
	# Strong Parameter
	def note_params
		params.require(:note).permit(:title, :content, :online_date)
	end

	def find_user_note
		# @note = Note.find(params[:id])
		# @note = Note.find_by(id: params[:id], user_id: current_user.id)
		@note = current_user.notes.find(params[:id])
	end
end
