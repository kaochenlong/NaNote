class CommentsController < ApplicationController
  before_action :check_login!
  before_action :find_user_note

  def create
    @note.comments.new(comment_params)

    if @note.save
      @content = comment_params[:content]
    else
      redirect_to "/"
    end
  end

  private
  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user_id: current_user.id)
  end

  def find_user_note
    @note = Note.find(params[:note_id])
  end
end
