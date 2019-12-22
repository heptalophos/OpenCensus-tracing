repl
=====

An OTP library.

Some very simple functionality to enable:
- Tracing the code using OpenCensus Tracing
- Registering an exporter to a backend 
- View traces of code execution on the backend 


Build
-----
```
    $ rebar3 compile
```

Requirements
------------
- Erlang 20.0+ and rebar3
- [Zipkin](https://opencensus.io/codelabs/zipkin/#0) as a tracing backend.
  We are picking it because it is free, open source and easy to setup.

Starting Zipkin
---------------

```
    docker run -d -p 9411:9411 openzipkin/zipkin
```

Running the code
----------------

Having already started Zipkin, the example can now be run by:
```
    rebar3 shell --sname repl@localhost

    (repl@localhost)1> repl:run().
```