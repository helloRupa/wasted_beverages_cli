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
          to_run = Hooks.make_action(action || block_action, self)
          to_run.call
          super(*args, &block)
        end
      end
    end
    prepend preceder
  end

  # I can't find a way to figure out the context of
  # which the Hooks.method gets called from.
  # Like if I put a binding.pry inside of
  # my def self.make_action(action, instance)
  # I can't find out that a Cli instance was
  # the previous context before this method was entered
  def self.make_action(action, instance)
    is_sym_or_str = action.is_a?(Symbol) || action.is_a?(String)

    # is there any other way to make a method from that symbol (e.g. :welcome)
    # on that instance without passing
    # in the instance (e.g. #<Cli:109471207asfaf>)
    is_sym_or_str ? instance.method(action) : action
    # I can't find any reason to use self.class.method(action).bind(self)
    # or really any way to use it that isn't convoluted.
  end
end
