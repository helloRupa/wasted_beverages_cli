# frozen_string_literal: true

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

# module Hooks
#   def before(method_names)
#     to_prepend = Module.new do
#       method_names.each do |name|
#         define_method(name) do |*args, &block|
#           App.banner
#           super(*args, &block)
#         end
#       end
#     end
#     prepend to_prepend
#   end
# end

# hooks module for Cli wide functionality
module Hooks
  def before_action(method_names, action = nil, &block_action)
    preceder = Module.new do
      method_names.each do |name|
        define_method(name) do |*args, &block|
          to_run = action || block_action
          to_run.is_a?(Proc) ? to_run.call : send(to_run)
          super(*args, &block)
        end
      end
    end
    prepend preceder
  end

  # def self.make_action(action, instance)
  #   is_sym_or_str = action.is_a?(Symbol) || action.is_a?(String)
  #   is_sym_or_str ? instance.method(action) : action
  # end
end
