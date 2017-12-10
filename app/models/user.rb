class User < ApplicationRecord
def uid
  return @uid.upcase
end
def uid=(value)
  @uid = value.upcase
end
end
