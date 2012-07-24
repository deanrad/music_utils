class Destination
  class TestFolder < Destination
    def initialize root
      @files = []
    end
    
    def put_file f, i
      super
      @files << f
    end
  end
end