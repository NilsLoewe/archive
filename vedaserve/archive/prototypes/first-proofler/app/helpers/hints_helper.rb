module HintsHelper

  def hint(tag)
    @hint = Hint.with_tag(tag)
    render @hint
  end

end
