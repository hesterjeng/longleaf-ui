[@@@mel.module "plotly"]

external new_plot :
  string ->
  < data : 'a Js.t array; layout : 'b Js.t > Js.t ->
  unit =
  "newPlot"

let name = "Lahey"

type layout =
  {
    title : string;
  }

type data =
  {
    x : int array;
    y : int array;
    type_ : string;
  }

let create_line_plot () =
  let x = [ 0; 1; 2; 3 ;4 ; 5 ] |> Array.of_list in
  let y = [ 0; 1; 2; 3 ;4 ; 5 ] |> Array.of_list in
  let data : data =
    {
      x; y ; type_ = "scatter"
    } [@mel.obj]
  in
  let layout = { title = "Line Plot" } [@mel.obj] in
  new_plot "myDiv" [%mel.obj { data; layout }]
