(** Adding a few functions to Pp. *)

(** When you emit newlines inside a pp box, in the resulting output you end up
    with trailing whitespaces on empty lines, whose length is equal to the
    size of the indentation at that point.

    Some tools complain about trailing whitespaces, such as git and editors.

    Thus, this function post process the string created by pp, and remove all
    trailing whitespaces. *)
val to_string : _ Pp.t -> string
