# Gollum file
class Page < GollumRails::Page

  # callbacks:
  #
  #  after_save :after_save
  #
  #  def after_save
  #
  #  end

  def id
    self.name
  end
  #
  #
  #def content
  #  self.gollum_page.formatted_data unless self.gollum_page.nil?
  #end
  #def raw_content
  #  self.gollum_page.raw_data unless self.gollum_page.nil?
  #end
  #def author
  #  self.gollum_page.version.author.name.gsub(/<>/, '') unless self.gollum_page.nil?
  #end
  #def date
  #  self.gollum_page.version.authored_date unless self.gollum_page.nil?
  #end
  #def preview(data)
  #  wiki.preview_page('Preview', data, FORMAT).formatted_data
  #end

end
