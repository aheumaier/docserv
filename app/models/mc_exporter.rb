class McExporter
  include Mongoid::Document
  store_in collection: "nodes", database: "puppet", session: "default"

  field :fqdn, type: String
  field :puppet_last_run_summary, type: Hash
  field :classes, type: Array
  field :facts, type: Hash
  field :agentlist, type: Array

end
