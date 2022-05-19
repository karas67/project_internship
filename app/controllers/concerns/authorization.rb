module Authrization
  extend ActiveSuport::Concern

  include do
    include Pundit
  end
end