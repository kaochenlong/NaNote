module NotesHelper
  def favorite_icon(user, note)
    classes = ['favorite_icon']

    if user
      on_or_off = user.favorite?(note) ? 'favorite-on' : 'favorite-off'
      classes << on_or_off
    end

    tag.div class: classes
  end
end
