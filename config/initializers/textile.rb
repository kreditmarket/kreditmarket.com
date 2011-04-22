class String
  def textile
    RedCloth.new(self).to_html
  end
end