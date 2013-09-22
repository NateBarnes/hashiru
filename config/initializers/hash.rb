class Hash
  def merge_or_add hsh, default_value=[]
    hsh.map do |key,value|
      old_value = self.fetch key, default_value
      new_value = old_value + (value || [])
      self.merge!({ key => new_value })
    end

    self
  end
end

