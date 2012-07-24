class Session
  attr_accessor :path
  attr_accessor :created
  attr_accessor :files
  
  def initialize path, files
    self.path = path
    self.files = files
    
    self.created = files.map(&:last).map{|f| f[:mtime]}.sort.first
  end
  
  def file_paths
    files.keys
  end
end