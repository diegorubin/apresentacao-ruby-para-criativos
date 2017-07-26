require "bunny"

conn = Bunny.new
conn.start

ch = conn.create_channel
q = ch.queue("example", :exclusive => true)

p = ch.queue("dlq")

q.subscribe(:block => true, :manual_ack => true) do |delivery_info, properties, payload|
  name = properties[:headers]['name']
  puts name

  p.publish(name)
end

