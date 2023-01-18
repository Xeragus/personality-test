module Presentable
  # Enforces naming convention for presenter files
  def decorate
    "#{self.class}Presenter".constantize.new(self)
  end
end
