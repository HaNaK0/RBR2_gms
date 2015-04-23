//converts from binary to int 

var bool_string = string(argument0);
var return_int = 0;

for(var i = 0; i < string_length(bool_string); i++)
{
    return_int += real(string_char_at(bool_string, i)) * 2 ^ i;
}

return return_int;
