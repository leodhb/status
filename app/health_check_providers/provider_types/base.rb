module ProviderTypes
  class Base
    APPLICATION_STATUSES = {
      normal: 'Normal',
      unstable: 'Unstable',
      down: 'Down'
    }.freeze
  
    ACCEPTABLE_TIMEOUT = 20
  end
end