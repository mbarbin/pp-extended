let to_string pp =
  let buffer = Buffer.create 23 in
  let formatter = Stdlib.Format.formatter_of_buffer buffer in
  Stdlib.Format.fprintf formatter "%a%!" Pp.to_fmt pp;
  let contents =
    Buffer.contents buffer
    |> String.split_lines
    |> List.map ~f:(fun s -> String.rstrip s ^ "\n")
    |> String.concat
  in
  contents
;;
