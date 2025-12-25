(****************************************************************************)
(*  pp-extended: Adding a few functions to Pp                               *)
(*  SPDX-FileCopyrightText: 2023 Mathieu Barbin <mathieu.barbin@gmail.com>  *)
(*  SPDX-License-Identifier: MIT                                            *)
(****************************************************************************)

let render pp =
  let buffer = Buffer.create 23 in
  let formatter = Format.formatter_of_buffer buffer in
  Format.fprintf formatter "%a%!" Pp.to_fmt pp;
  let contents = Buffer.contents buffer in
  let len = String.length contents in
  if len = 0
  then ""
  else (
    (* Detect eol style from first newline, default to LF. *)
    let use_crlf =
      match String.index_opt contents '\n' with
      | None -> false
      | Some i -> i > 0 && String.get contents (i - 1) = '\r'
    in
    let result = Buffer.create len in
    let pos = ref 0 in
    while !pos < len do
      let line_end =
        match String.index_from_opt contents !pos '\n' with
        | Some i -> i
        | None -> len
      in
      (* Exclude \r if part of \r\n. *)
      let content_end =
        if line_end > !pos && line_end < len && String.get contents (line_end - 1) = '\r'
        then line_end - 1
        else line_end
      in
      (* Strip trailing whitespace by searching backwards. *)
      let last_non_ws = ref (content_end - 1) in
      while
        !last_non_ws >= !pos
        &&
        let c = String.get contents !last_non_ws in
        c = ' ' || c = '\t'
      do
        decr last_non_ws
      done;
      if !last_non_ws >= !pos
      then Buffer.add_substring result contents !pos (!last_non_ws - !pos + 1);
      let next_pos = line_end + 1 in
      if next_pos < len
      then (
        if use_crlf then Buffer.add_char result '\r';
        Buffer.add_char result '\n');
      pos := next_pos
    done;
    let result_len = Buffer.length result in
    if result_len = 0
    then ""
    else (
      if use_crlf then Buffer.add_char result '\r';
      Buffer.add_char result '\n';
      Buffer.contents result))
;;

let to_string = render
