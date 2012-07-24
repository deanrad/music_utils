class Kitchen
  attr_accessor :device
  attr_accessor :seen_sessions
  attr_accessor :destinations
    
  def initialize( device, opts={} )
    self.device = device
    
    self.seen_sessions = opts[:seen_sessions] || []
  end
  
  def new_sessions
     device.sessions.select{ |s| ! seen_sessions.include?(s.path)}
  end
  
  def new_files
    new_sessions.map(&:file_paths).flatten
  end
  
  def import session, settings={} #, &each_file
    unless sess = device.sessions.detect{|s| s.path==session}
      raise ArgumentError, "Session #{session} not found" 
    end
    sess.files.each do |f, fi| 
      destinations.each do |d|
        d.put_file( sess.path, fi)
      end
      # apply tags, add to destinations..
      #each_file.call(f) if block_given?
    end
    self.seen_sessions << session
  end
end