let make_hello () =
  React.string "Hi" [@react.component]

let () = match ReactDOM.querySelector "#root" with
  | None -> Js.Console.error "Unable to find root element"
  | Some element ->
    let root = ReactDOM.Client.createRoot element in
    ReactDOM.Client.render root (make_hello ())
