# Created by Satoshi Nakagawa.
# You can redistribute it and/or modify it under the Ruby's license or the GPL2.

require 'utility'

module UserDefaultsAccess
  
  private
  
  def read_defaults(key)
    convert_to_ruby_obj(NSUserDefaults.standardUserDefaults.objectForKey(key))
  end

  def write_defaults(key, value)
    NSUserDefaults.standardUserDefaults.setObject(value, forKey:key)
  end
  
  def convert_to_ruby_obj(v)
    return v if v == nil || v == false || v == true
    v.is_a?(NSObject) ? v.to_ruby : v
  end
  
end
