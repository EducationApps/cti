require 'rails'

module Cti
  
  class Railtie < Rails::Railtie
    
    initializer 'cti' do |app|
      
      ActiveSupport.on_load(:active_record) do
        require 'cti/active_record/acts_as_predecessor'
        require 'cti/active_record/acts_as_heir'
        ::ActiveRecord::Base.send(:extend, Cti::ActiveRecord::ActsAsPredecessor)
        ::ActiveRecord::Base.send(:extend, Cti::ActiveRecord::ActsAsHeir)
      end
      
    end
    
  end
  
end