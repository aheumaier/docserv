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


  def self.facts(node_name)
    Node.find(:all, :from => '/v3/nodes/'+node_name+'/facts')
  end


end
