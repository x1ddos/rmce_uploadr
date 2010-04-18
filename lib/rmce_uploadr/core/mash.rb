class Mash < Hash
  def method_missing(meth, *args, &block)
    self[meth.to_s] || self[meth]
  end
end
