class Fact < ActiveResource::Base
  include ActiveResource::Extend::WithoutExtension

  def initialize(attributes = [], persisted = false)
    super
    self.id = self.certname.gsub('.', '_')
  end

  self.site = "http://puppetdb001.int.arvm.de:8080/v3"
  self.element_name = "facts-names"
  self.format = ::JsonFormatter.new('facts')

  def nodes
    pocket = Hash.new
    Node.find(:all, :from => '/v3/facts/'+self.name+'/nodes').map {|n| pocket[n.name] = n.value }
    return pocket
  end

  def artifact_id
    Node.find(:first, :from => '/v3/nodes/'+self.name+'/nodes/artifact_id').value
  end

end
