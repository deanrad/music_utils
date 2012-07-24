class Destination
  attr_accessor :sessions

  def put_file( s, f )
    self.sessions ||= {}
    self.sessions[s] ||= []
    self.sessions[s] << f
  end

end
