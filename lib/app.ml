type layout = { title : string }
type data = { x : int array; y : int array; type_ : string [@mel.as "type"] }

external new_plot : string -> data array -> layout -> unit = "newPlot"
[@@mel.module "Plotly"]

let name = "Lahey"

(* let create_line_plot () = *)
(*   let x = [ 0; 1; 2; 3; 4; 5 ] |> Array.of_list in *)
(*   let y = [ 0; 1; 2; 3; 4; 5 ] |> Array.of_list in *)
(*   let data : data = { x; y; type_ = "scatter" } in *)
(*   let layout = { title = "Line Plot" } in *)
(*   new_plot "myDiv" [| data |] layout [@react.component] *)
(* let create_line_plot () = *)
(*   (\* React component that handles side-effect of calling Plotly to render the plot *\) *)
(*   let () = *)
(*     let x = [ 0; 1; 2; 3; 4; 5 ] |> Array.of_list in *)
(*     let y = [ 0; 1; 2; 3; 4; 5 ] |> Array.of_list in *)
(*     let data : data = { x; y; type_ = "scatter" } in *)
(*     let layout = { title = "Line Plot" } in *)
(*     new_plot "myDiv" [| data |] layout *)
(*   in *)
(*   (\* Return a div element with an id "myDiv" where Plotly will render the plot *\) *)
(*   React.createElement "div" ~props:(Js.Dict.fromList [("id", Js.Json.string "myDiv")]) [||] [@react.component] *)

(* [@react.component] *)
(* let create_line_plot () = *)
(*   (\* Plot data *\) *)
(*   let x = [| 0; 1; 2; 3; 4; 5 |] in *)
(*   let y = [| 0; 1; 2; 3; 4; 5 |] in *)
(*   let data : data = { x; y; type_ = "scatter" } in *)
(*   let layout = { title = "Line Plot" } in *)

(*   (\* Use Plotly to render the plot as a side effect *\) *)
(*   React.useEffect0 (fun () -> *)
(*     new_plot "myDiv" [| data |] layout; *)
(*     None); *)

(*   (\* Return a div with the id "myDiv" for Plotly to render into *\) *)
(*   React.Dom.div ~id:"myDiv" [] *)
(* [@react.component] *)
(* let create_line_plot () = *)
(*   (\* Plot data *\) *)
(*   let x = [| 0; 1; 2; 3; 4; 5 |] in *)
(*   let y = [| 0; 1; 2; 3; 4; 5 |] in *)
(*   let data : data = { x; y; type_ = "scatter" } in *)
(*   let layout = { title = "Line Plot" } in *)

(*   (\* Use Plotly to render the plot as a side effect *\) *)
(*   React.useEffect0 (fun () -> *)
(*     new_plot "myDiv" [| data |] layout; *)
(*     None); *)

(*   (\* Create a div element with the id "myDiv" for Plotly to render into *\) *)
(*   React.createElement "div" *)
(*     ~props:(Js.Dict.fromList [("id", Js.Json.string "myDiv")]) *)
(*     [||] *)
[@react.component]
let create_line_plot () =
  (* Plot data *)
  let x = [| 0; 1; 2; 3; 4; 5 |] in
  let y = [| 0; 1; 2; 3; 4; 5 |] in
  let data : data = { x; y; type_ = "scatter" } in
  let layout = { title = "Line Plot" } in

  (* Use Plotly to render the plot as a side effect *)
  React.useEffect0 (fun () ->
    new_plot "myDiv" [| data |] layout;
    None);

  (* Return a div with the id "myDiv" where Plotly will render the plot *)
  React.createElement "div" [| React.string "Plot will render here" |] [@react.component]


let () = match ReactDOM.querySelector "#root" with
  | None -> Js.Console.error "Unable to find root element"
  | Some element ->
    let root = ReactDOM.Client.createRoot element in
    ReactDOM.Client.render root (create_line_plot ())
