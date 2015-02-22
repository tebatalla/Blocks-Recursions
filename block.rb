class Array
  def my_each(&prc)
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end
  end

  def my_map(&prc)
    result = []
    my_each do |item|
      result << prc.call(item)
    end
    result
  end

  def my_select(&prc)
    [].tap do |result|
      self.my_each do |item|
        result << item if prc.call(item)
      end
    end
  end

  def my_inject(&prc)
    duplicate = self.dup
    accumulator = duplicate.shift

    duplicate.my_each do |elem|
      accumulator = prc.call(accumulator, elem)
    end

    accumulator
  end

  def my_sort!(&prc)
    sorted = false
    i = 0
    until sorted
      sorted = true
      j = i
      while j < count
        if prc.call(self[i], self[j]) == 1
          self[j], self[i] = self[i], self[j]
          sorted = false
        end
        j += 1
      end
      i += 1
    end
    self
  end

  def my_sort(&prc)
    self.dup.my_sort!(&prc)
  end
end

def eval_block(*args, &prc)
  if prc.nil?
    p "NO BLOCK GIVEN!"
  else
    prc.call(*args)
  end
end
