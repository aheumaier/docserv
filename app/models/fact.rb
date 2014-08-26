class Fact < ActiveResource::Base
  include ActiveResource::Extend::WithoutExtension

  def initialize(attributes = [], persisted = false)
    super
    self.id = self.certname.gsub('.', '_')
  end

  self.site = "http://puppetdb001.int.arvm.de:8080/v3"
  self.element_name = "facts"
  self.format = ::JsonFormatter.new(:collection_name)

end
