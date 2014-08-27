require 'json'
class Node < ActiveResource::Base
  include ActiveResource::Extend::WithoutExtension

  def initialize(attributes = {}, persisted = false) 
    super 
    self.id = self.name.gsub('.', '_')
  end

  self.site = "http://puppetdb001.int.arvm.de:8080/v3"
  self.element_name = "nodes"
  self.format = JsonFormatter.new("nodes")


  def facts
    pocket = Hash.new
    Node.find(:all, :from => '/v3/nodes/'+self.name+'/facts').map {|n| pocket[n.name] = n.value }
    return pocket
  end

  def artifact_id
    Node.find(:first, :from => '/v3/nodes/'+self.name+'/facts/system_role').value
  end


end
