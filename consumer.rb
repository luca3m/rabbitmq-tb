require 'bunny'

conn = Bunny.new "amqp://#{ARGV[0]}"
conn.start

ch = conn.create_channel

q = ch.queue(ARGV[1])

q.subscribe block: true do |delivery_info, metadata, payload |
  puts "Received #{payload}"
end


