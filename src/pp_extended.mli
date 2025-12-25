(** Adding a few functions to Pp. *)

(** Renders a [Pp.t] to a string with trailing whitespace stripped from each
    line.

    {2 When to use}

    This function is intended for multi-line rendering of pretty-printed
    documents, such as source code or custom language files, that are expected
    to be opened in editors or checked into version control (e.g., git). For
    small one-liners or output not subject to editor/git constraints, prefer
    simpler options such as [Format.asprintf "%a" Pp.to_fmt pp].

    {2 Motivation}

    When you emit newlines inside a pp box, in the resulting output you end up
    with trailing whitespaces on empty lines, whose length is equal to the size
    of the indentation at that point. Some tools complain about trailing
    whitespaces, such as git and editors.

    {2 Whitespace}

    Trailing whitespace is defined as spaces and tabs only, matching the
    behavior of common editor "trim trailing whitespace" features.

    {2 Line endings}

    Both LF ([\n], Unix) and CRLF ([\r\n], Windows) are recognized as line
    endings. Standalone CR ([\r], Classic Mac) is not supported and will be
    treated as regular content.

    The end-of-line style is detected from the first newline in the input and
    used consistently throughout the output, including the trailing newline. If
    no newlines are present, defaults to LF.

    {2 Empty input}

    Empty input produces empty output (no trailing newline is added). *)
val render : _ Pp.t -> string

(** This was reimplemented and renamed [render]. Compared to [render],
    [to_string] used to have small differences, such as normalizing line endings
    to [\n] and trimming vertical tabs and form feed. These differences have
    been removed, now this function is simply an alias to [render]. It is
    deprecated and should be replaced by [render]. *)
val to_string : _ Pp.t -> string
[@@ocaml.deprecated
  "[since 2025-12] Use [Pp_extended.render]. Hint: Run [ocamlmig migrate]"]
[@@migrate { repl = Rel.render }]
