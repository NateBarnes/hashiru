class LinearRegression
  attr_accessor :size, :slope, :offset

  def initialize x_set, y_set=nil
    self.size = x_set.size
    y_set,x_set = x_set,axis unless y_set
    raise "arguments not same length!" unless size == y_set.size

    x_set = convert_to_float x_set
    y_set = convert_to_float y_set
    sigma_xx = sigma_xy = sigma_x = sigma_y = 0

    x_set.zip(y_set).each do |x,y|
      sigma_xy += x * y
      sigma_xx += x * x
      sigma_x  += x
      sigma_y  += y
    end

    self.slope = ( size * sigma_xy - sigma_x * sigma_y ) / ( size * sigma_xx - sigma_x * sigma_x )
    self.offset = (sigma_y - slope * sigma_x) / size
  end

  def convert_to_float arr
    arr.each_with_index { |num,idx| arr[idx] = Float(num) }
  end

  def fit
    axis.map{ |data| predict data }
  end

  def predict x
    y = slope * x + offset
  end

  def axis
    (0...size).to_a
  end
end
