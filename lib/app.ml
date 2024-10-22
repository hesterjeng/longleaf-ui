module Lib = Longleaf_ui_lib

match ReactDOM.querySelector "#root" with
  | None -> Js.Console.error "Unable to find root element"
  | Some element ->
    let root = ReactDOM.Client.createRoot element in
    ReactDOM.Client.render root app
