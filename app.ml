module Lib = Longleaf_ui_lib

let () =
  let _ = Lib.create_line_plot () in
  Js.log(Lib.name)
