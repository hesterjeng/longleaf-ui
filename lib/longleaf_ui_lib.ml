type layout = { title : string }
type data = { x : int array; y : int array; type_ : string [@mel.as "type"] }

external new_plot : string -> data array -> layout -> unit = "newPlot"
[@@mel.module "Plotly"]

let name = "Lahey"

let create_line_plot () =
  let x = [ 0; 1; 2; 3; 4; 5 ] |> Array.of_list in
  let y = [ 0; 1; 2; 3; 4; 5 ] |> Array.of_list in
  let data : data = { x; y; type_ = "scatter" } in
  let layout = { title = "Line Plot" } in
  new_plot "myDiv" [| data |] layout [@react.component]
