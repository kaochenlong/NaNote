module NotesHelper
  def favorite_icon(user, note)
    classes = ['favorite_icon']

    if user
      classes << (user.favorite?(note) ? 'favorite-on' : 'favorite-off')
    end

    tag.div class: classes, "data-favorite-target": "icon"
  end
end
