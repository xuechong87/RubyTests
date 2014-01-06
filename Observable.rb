begin  
require "observer"
#################################################################################
# Observable: The notifying class mixes in the Observable module, 
# which provides the methods for managing the associated observer objects. 

# The observers must implement a method called update to receive notifications. 

# The observable object must: 

# assert that it has changed 

# call notify_observers 
###################################################################################
class Tick
	include Observable
	def tick
		loop do
			now  = Time.now
			changed
			notify_observers(now.hour,now.min,now.sec)
			sleep 1.0 - Time.now.usec/1000000.0
		end
	end
end

#观察者
class TextClock
	def update (h,m,s)
		printf "\e[8D %02d:%02d:%02d]\n",h,m,s
		STDOUT.flush
	end
end

tick = Tick.new
tick.add_observer(TextClock.new)
tick.tick

rescue =>err
	puts err
end
p "exit"
gets ("exit")

# Public Instance Methods
# add_observer(observer, func=:update) click to toggle source 
# Add observer as an observer on this object. so that it will receive notifications. 

# observer the object that will be notified of changes. 
 
# func Symbol naming the method that will be called when this Observable has changes. 

# This method must return true for observer.respond_to? and will receive *arg when notify_observers is called, where *arg is the value passed to notify_observers by this Observable 
 
#      # File lib/observer.rb, line 126
# 126:   def add_observer(observer, func=:update)
# 127:     @observer_peers = {} unless defined? @observer_peers
# 128:     unless observer.respond_to? func
# 129:       raise NoMethodError, "observer does not respond to `#{func.to_s}'"
# 130:     end
# 131:     @observer_peers[observer] = func
# 132:   end
# changed(state=true) click to toggle source 
# Set the changed state of this object. Notifications will be sent only if the changed state is true. 

# state Boolean indicating the changed state of this Observable. 
 
#      # File lib/observer.rb, line 167
# 167:   def changed(state=true)
# 168:     @observer_state = state
# 169:   end
# changed?() click to toggle source 
# Returns true if this object’s state has been changed since the last notify_observers call. 

#      # File lib/observer.rb, line 175
# 175:   def changed?
# 176:     if defined? @observer_state and @observer_state
# 177:       true
# 178:     else
# 179:       false
# 180:     end
# 181:   end
# count_observers() click to toggle source 
# Return the number of observers associated with this object. 

#      # File lib/observer.rb, line 153
# 153:   def count_observers
# 154:     if defined? @observer_peers
# 155:       @observer_peers.size
# 156:     else
# 157:       0
# 158:     end
# 159:   end
# delete_observer(observer) click to toggle source 
# Remove observer as an observer on this object so that it will no longer receive notifications. 

# observer An observer of this Observable 
 
#      # File lib/observer.rb, line 139
# 139:   def delete_observer(observer)
# 140:     @observer_peers.delete observer if defined? @observer_peers
# 141:   end
# delete_observers() click to toggle source 
# Remove all observers associated with this object. 

#      # File lib/observer.rb, line 146
# 146:   def delete_observers
# 147:     @observer_peers.clear if defined? @observer_peers
# 148:   end
# notify_observers(*arg) click to toggle source 
# Notify observers of a change in state if this object’s changed state is true. 

# This will invoke the method named in add_observer, pasing *arg. The changed state is then set to false. 

# *arg Any arguments to pass to the observers. 
 
     # File lib/observer.rb, line 191
# 191:   def notify_observers(*arg)
# 192:     if defined? @observer_state and @observer_state
# 193:       if defined? @observer_peers
# 194:         @observer_peers.each do |k, v|
# 195:           k.send v, *arg
# 196:         end
# 197:       end
# 198:       @observer_state = false
# 199:     end
# 200:   end