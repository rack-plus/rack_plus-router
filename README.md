Rack+ Router
============

Rack+ router is a library for routing Rack requests to controllers, in a manner
similar to Rails. It is part of the Rack+ framework.


Specification
-------------
A Rack+ router is a Ruby object that responds to `call`. It takes exactly one
argument, a Rack Environment, and returns either a Rack application (referred
to as a "route" in this context), or nil if no route could be found.
