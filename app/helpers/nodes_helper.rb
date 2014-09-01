module NodesHelper

  def format_puppet_classes_ass_tree(value)

    if value =~ /::/
      a = value.split('::')
      depth = a.size-1
      s = '|______'
      depth.times { s << '*____'}
      s << a.last
      return s
    else
      '|__'+value
    end
  end

end