class Api::V1::NotesController < ApplicationController

  def favorite
    render json: params
  end
end
