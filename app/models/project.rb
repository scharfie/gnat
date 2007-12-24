class Project < ActiveRecord::Base
public
  # returns a more friendly URL consisting of
  # id and key (i.e. 1-gnat)
  def to_param
    "#{id}-#{key}"
  end
end
