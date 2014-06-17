	class Item
		def initialize(attrs=nil)
			attrs && attrs.each do |attr, value|
				setter = "#{attr}="
				self.send(setter, value) if self.class.method_defined?(setter)
			end
    end
    def as_hash
      item_hash = {}
      self.instance_variables.each do |attr|
        item_hash[attr.to_s[1...attr.length]] = self.instance_variable_get(attr)
      end
      return item_hash
    end
	end

