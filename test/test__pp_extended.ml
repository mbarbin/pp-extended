let%expect_test "to_string" =
  let pp =
    Pp.box
      ~indent:2
      (Pp.concat [ Pp.text "Hello,"; Pp.newline; Pp.newline; Pp.text "World!" ])
  in
  let show_string str =
    print_s [%sexp (str : string)];
    print_endline str
  in
  (* If you simply uses [Pp], you'll end up with trailing white spaces in the
     output. *)
  let str = Stdlib.Format.asprintf "%a" Pp.to_fmt pp in
  show_string str;
  [%expect {|
    "Hello,\n  \n  World!"
    Hello,

      World! |}];
  (* If you use [Pp_extended], the trailing white spaces are trimmed. *)
  show_string (Pp_extended.to_string pp);
  [%expect {|
    "Hello,\n\n  World!\n"
    Hello,

      World! |}]
;;
