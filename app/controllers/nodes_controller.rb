class NodesController < ApplicationController
  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nodes }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    @node = Node.find(params[:id].gsub('_', '.'))
    @node_facts = @node.facts
    @node_artifact_id = @node.artifact_id
    @mc_data =  McExporter.find_by(fqdn: @node.name )
    @page = Page.find_or_initialize_by_name(@node_artifact_id, commit: { name: 'system', email: 'sysop@mondiamedia.com', message: 'created page '+@node_artifact_id })


    unless @page.persisted?
      begin
        logger.info 'Logger: calling update_attributes on Nodes#show '
        node_template = Erubis::Eruby.new( File.read('lib/templates/node_wiki_template.md.erb') ).result({my_artifact_id:"#{@node_artifact_id}"})
        logger.info node_template
        @page.update_attributes(content: node_template, commit: { name: 'system', email: 'sysop@mondiamedia.com', message: 'updated template on '+@node_artifact_id })
        @page.save
        flash[:success] = "Successfully persisting page."
      rescue => e
        flash[:error] = "Error occured while persisting page."
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node }
    end
  end
end
