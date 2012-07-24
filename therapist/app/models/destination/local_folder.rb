class Destination
  class LocalFolder < Destination
    def put_file f, i
      super
    end
  end
end