class Api::V1::NotesController < ApplicationController
  before_action :check_login!

  def favorite
    note = Note.find(params[:id])

    if Bookmark.exists?(note: note)
      # 移除最愛
      current_user.favorite_notes.delete(note)
      render json: { status: "removed", id: params[:id] }
    else
      # 新增最愛
      current_user.favorite_notes << note
      render json: { status: "added", id: params[:id] }
    end
  end
end
