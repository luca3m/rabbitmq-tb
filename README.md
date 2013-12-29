RabbitMQ TestBench
===========

An easily to setup environment useful to make confidence with [RabbitMQ](http://www.rabbitmq.com).
For example with [Federation](http://www.rabbitmq.com/federation.html) and
[High Availability](http://www.rabbitmq.com/ha.html) features.
It uses [Vagrant](http://www.vagrantup.com) to create virtual machines and Puppet to provision them.

## Usage

To setup a testbench, install Vagrant and checkout this git repository. Then run these commands:

```
$ git submodule init
$ git submodule update
$ vagrant up
```

Vagrant will create two virtual machines with RabbitMQ installed, aready configured with management
interface and Federation plugin. There are also two Ruby scripts to easily publish and consume messages
from RabbitMQ. They can be used in this way:

```
$ gem install bunny
$ ruby {producer,consumer}.rb <ip_address> <queue_name>
```

The former will publish message on specified broker and queue, the latter will consume from the
same environment.

## TODO

1. Create 4 nodes, to simulate two cluster connected via WAN: rabbitmq-a-{1,2} and rabbitmq-b-{1,2}
2. Simulate WAN QoS between **A** and **B**
