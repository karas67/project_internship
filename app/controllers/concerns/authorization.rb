module Authrization
  # extend ActiveSupport::Concern

  include do
    include Pundit
  end
end