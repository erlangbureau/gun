-module(gun_headers).
-export([content_length/3]).

content_length(Method, Headers, _Body) when Method == <<"GET">>; Method == <<"HEAD">> ->
    lists:keydelete(<<"content-length">>, 1, Headers);
content_length(_Method, Headers, Body) ->
    NewValue = {<<"content-length">>, integer_to_binary(iolist_size(Body))},
    lists:keystore(<<"content-length">>, 1, Headers, NewValue).

