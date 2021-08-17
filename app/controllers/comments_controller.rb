class CommentsController < ApplicationController
  before_action :check_login!
  before_action :find_user_note

  def create
    @note.comments.new(comment_params)

    if @note.save
      redirect_to @note
    else
      redirect_to "/"
    end
  end

  private
  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user: current_user)
  end

  def find_user_note
    @note = current_user.notes.find(params[:note_id])
  end
end
