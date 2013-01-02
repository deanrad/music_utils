class Symbol
  def opposite
    return :L if self == :R
    return :R if self == :L
    return :"L<" if self == :"R<"
    return :"R<" if self == :"L<"
  end
  def accent
    return :"L<" if [:"L<", :L].include? self
    return :"R<" if [:"R<", :R].include? self
  end
  def accented?
    !! self.to_s.index("<")
  end
end

class Enumerator
  class << self
    def alternator seq = [:R]
      self.new do |downstream|
        loop do
          seq.each do |elem|
            downstream << elem
          end
          seq.map(&:opposite).each do |elem|
            downstream << elem
          end
        end
      end
    end
  end
  
  def repeater size=2 
    self.class.new do |downstream|
      loop do
        self.next.tap do |single|
          size.times do 
            downstream << single
          end
        end
      end
    end
  end
  
  def replaceABwAA size=2
    self.class.new do |downstream|
      loop do
        (size / 2).times do 
          downstream << self.next
        end
        (size / 2).times do
          self.next
        end
      end
    end
  end

  def skip size=1
    size.times do
      self.next
    end
    self.class.new do |downstream|
      loop do
        downstream << self.next
      end
    end
  end
  
  def accent_every size=1, offset=size-1
    self.class.new do |downstream|
      offset.times do 
        downstream << self.next
      end
      loop do
        downstream << self.next.accent
        (size-1).times do
          downstream << self.next
        end
      end
    end
  end

  def double_every size=1, offset=size-1
    self.class.new do |downstream|
      offset.times do 
        downstream << self.next
      end
      loop do
        self.next.tap do |single|
          2.times do
            downstream << single
          end
          (size-1).times do
            downstream << self.next
          end
        end
      end
    end
  end
  
  def paradiddle
    double_every 3
  end
  
end