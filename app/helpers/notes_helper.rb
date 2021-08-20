module NotesHelper
  def favorite_icon(user, note)
    if user
      if user.favorite?(note)
        '<div class="favorite_icon favorite-on"></div>'.html_safe
      else
        '<div class="favorite_icon favorite-off"></div>'.html_safe
      end
    else
      '<div class="favorite_icon"></div>'.html_safe
    end
  end
end
