require 'bunny'

conn = Bunny.new "amqp://#{ARGV[0]}"
conn.start

ch = conn.create_channel

x = ch.default_exchange

i=0
while true do
  i+=1
  x.publish("Message #{i}", routing_key: ARGV[1]) 
  puts "Sent message #{i}"
  sleep 0.5
end
