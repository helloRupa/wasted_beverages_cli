# module M
#   def self.before(*names)
#     names.each do |name|
#       m = instance_method(name)
#       define_method(name) do |*args, &block|  
#         yield
#         m.bind(self).(*args, &block)
#       end
#     end
#   end
# end

# hooks module for Cli wide functionality
module Hooks
  def before(method_names)
    to_prepend = Module.new do
      method_names.each do |name|
        define_method(name) do |*args, &block|
          App.banner
          super(*args, &block)
        end
      end
    end
    prepend to_prepend
  end
end
