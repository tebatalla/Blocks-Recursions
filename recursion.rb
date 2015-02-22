def range(start, ending)
  return [] if ending < start
  [start] + range(start + 1, ending)
end

def sum_recursive(array)
  return array.first if array.length == 1
  array.first + sum_recursive(array.drop(1))
end

def sum_iterative(array)
  array = array.dup
  sum = 0
  until array.empty?
    sum += array.shift
  end
  sum
end

def exp_one (base, power)
  return base if power <= 1
  base * exp_one(base, power - 1)
end

def exp_two (base, power)
  return 1 if power == 0
  return base if power == 1
  if power.even?
    sq_half = exp_two(base, power / 2)
    sq_half * sq_half
  else
    sq_half = exp_two(base, (power - 1) / 2)
    sq_half * sq_half
  end
end

class Array
  def deep_dup
    return self unless self.is_a?(Array)
    result = []
    each do |item|
      result << (item.is_a?(Array) ? item.deep_dup : item)
    end
    result
  end

  def subsets
    return [[]] if self.empty?
    subs = array.take(count - 1).subsets
    subs += subs.map { |sub| sub + [last] }
  end

  def quicksort

    pivot = self.sample

    return self if self.length <= 1

    less, greater, equal = [], [], []

    self.each do |elem|
      if elem < pivot
        less << elem
      elsif elem > pivot
        greater << elem
      else
        equal << elem
      end
    end

    less.quicksort + equal + greater.quicksort
  end

  def my_tap(&prc)
    prc.call(self)
    self
  end
end

def fibonacci(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  previous = fibonacci(n - 1)
  preprevious = fibonacci(n - 2)
  previous += [previous.last + preprevious.last]
end

def bsearch(array, target)
  return nil if array.empty?
  half = array.length / 2
  if array[half] == target
    return half
  elsif array[half] > target
    bsearch(array[0...half], target)
  else
    right = bsearch(array[(half + 1)..-1], target)
    half + 1 + right unless right.nil?
  end

end

def merge_sort(array)
  return array if array.length <= 1
  half = array.length / 2
  left = array.take(half)
  right = array.drop(half)
  merge(merge_sort(left),merge_sort(right))
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first < right.first
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged + left + right
end
