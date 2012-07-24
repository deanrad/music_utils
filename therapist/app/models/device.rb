class Device 
  attr_accessor :files

  attr_accessor :path
  
  def initialize(files = nil)
    case files
    when NilClass
      self.files = (`find #{self.path} -type f`.split).inject({}){ |memo, f| 
        fi = File.new(f)
        memo.store(f, Hash[:path, f,
                           :mtime, fi.mtime])
        memo
      }
    when Hash
      self.files = files
      # make the fileinfo hash contain the full path
      files.each{|k,v| v[:path] = File.join( self.path, k )}
    end
  end  
  
  def sessions
    folder_names = files.keys.map do |f| 
      f.sub( self.path+File::SEPARATOR, '').split(File::SEPARATOR)[0]
    end
    folder_names.uniq.map do |sess_folder|
      Session.new(sess_folder, files.select{ |k,v| k.include?(sess_folder) })
    end
  end
  
end
