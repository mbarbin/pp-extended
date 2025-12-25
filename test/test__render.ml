module Pp = struct
  include Pp

  let render = Pp_extended.render
end

let%expect_test "render" =
  let pp =
    Pp.box
      ~indent:2
      (Pp.concat [ Pp.text "Hello,"; Pp.newline; Pp.newline; Pp.text "World!" ])
  in
  let show_string str =
    Printf.printf "%S\n" str;
    print_endline str
  in
  (* If you simply uses [Pp], you'll end up with trailing white spaces in the
     output. *)
  let str = Format.asprintf "%a" Pp.to_fmt pp in
  show_string str;
  [%expect
    {|
    "Hello,\n  \n  World!"
    Hello,

      World! |}];
  (* If you use [Pp.render], the trailing white spaces are trimmed. *)
  show_string (Pp.render pp);
  [%expect
    {|
    "Hello,\n\n  World!\n"
    Hello,

      World!
    |}]
;;

(* Both LF and CRLF are recognized as line endings. The style is detected from
   the first newline and used consistently throughout the output. *)
let%expect_test "render - eol style detected from first newline" =
  let show_string str = Printf.printf "%S\n" str in
  (* Unix style: first newline is \n, all output uses \n. *)
  let pp_unix = Pp.verbatim "Hello\nWorld" in
  show_string (Pp.render pp_unix);
  [%expect {| "Hello\nWorld\n" |}];
  (* Windows style: first newline is \r\n, all output uses \r\n. *)
  let pp_windows = Pp.verbatim "Hello\r\nWorld" in
  show_string (Pp.render pp_windows);
  [%expect {| "Hello\r\nWorld\r\n" |}];
  (* Mixed input: style detected from first newline (\r\n), used throughout. *)
  let pp_mixed = Pp.verbatim "First\r\nSecond\nThird" in
  show_string (Pp.render pp_mixed);
  [%expect {| "First\r\nSecond\r\nThird\r\n" |}]
;;

(* Trailing whitespace is defined as spaces and tabs only, matching the
   behavior of common editor "trim trailing whitespace" features. *)
let%expect_test "render - strips trailing whitespace (spaces and tabs)" =
  let show_string str = Printf.printf "%S\n" str in
  (* Trailing spaces and tabs are stripped. *)
  let pp = Pp.verbatim "Hello \t \n  World  \n" in
  show_string (Pp.render pp);
  [%expect {| "Hello\n  World\n" |}];
  let pp_crlf = Pp.verbatim "Hello  \r\n  World  \r\n" in
  show_string (Pp.render pp_crlf);
  [%expect {| "Hello\r\n  World\r\n" |}]
;;

(* Empty input produces empty output (no trailing newline is added). *)
let%expect_test "render - empty input stays empty" =
  let show_string str = Printf.printf "%S\n" str in
  let pp_empty = Pp.verbatim "" in
  show_string (Pp.render pp_empty);
  [%expect {| "" |}];
  (* Whitespace-only input also becomes empty after trimming. *)
  let pp_spaces = Pp.verbatim "   " in
  show_string (Pp.render pp_spaces);
  [%expect {| "" |}]
;;

(* When no newlines are present in the input, defaults to LF. *)
let%expect_test "render - no newlines defaults to LF" =
  let show_string str = Printf.printf "%S\n" str in
  let pp = Pp.verbatim "Hello World" in
  show_string (Pp.render pp);
  [%expect {| "Hello World\n" |}]
;;

(* Standalone CR (Classic Mac line ending) is not recognized as a line ending
   and is treated as regular content. *)
let%expect_test "render - standalone CR treated as content" =
  let show_string str = Printf.printf "%S\n" str in
  (* Standalone \r is preserved as content. *)
  let pp = Pp.verbatim "Hello\rWorld\n" in
  show_string (Pp.render pp);
  [%expect {| "Hello\rWorld\n" |}];
  (* Trailing spaces after \r are trimmed, but \r itself is kept. *)
  let pp2 = Pp.verbatim "Hello\r  \n" in
  show_string (Pp.render pp2);
  [%expect {| "Hello\r\n" |}]
;;
