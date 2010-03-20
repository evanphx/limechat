# Created by Satoshi Nakagawa.
# You can redistribute it and/or modify it under the Ruby's license or the GPL2.

module UrlOpener
  
  def openUrl(str)
    url = OSX::NSURL.URLWithString(str)
    OSX::NSWorkspace.sharedWorkspace.openURL(url)
  end
  
  extend self
end
