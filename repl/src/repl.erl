-module(repl).

%% API exports
-export([run/0]).

%%====================================================================
%% API functions
%%====================================================================

-spec run() -> fun().
run() -> 
    read_eval_process().

%%====================================================================
%% Auxiliary functions
%%====================================================================

read_eval_process() ->
    ocp:with_child_span("repl"),
    
    Line = read_line(),

    Annotation = oc_span:annotation(<<"Invoking process_line/1">>,
                                    #{<<"len">> => length(Line),
                                      <<"use">> => <<"repl">>}),
    ocp:add_time_event(Annotation),

    Out = process_line(Line),
    io:format("~n< ~s~n~n", [Out]),

    ocp:finish_span(),

    read_eval_process().

read_line() ->
    ocp:with_child_span("read_line"),
    try 
        io:get_line("> ")
    after
        ocp:finish_span()
    end.


process_line(Line) ->
    ocp:with_child_span("process_line"),
    try
        string:uppercase(Line)
    after 
        ocp:finish_span()
    end.