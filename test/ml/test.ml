module C = Css_materialize

let onload _ =
  C.Head.add_css_materialize C.Head.Bower_css;
  C.Head.add_icons "fonts/materialize_fonts.css";

  let container = C.Grid.create_container "" in
  let row = C.Grid.create_row "" in
  let col_large = C.Grid.create_col ~lg:3 "" in
  let col_normal = C.Grid.create_col ~lg:3 "" in
  let btn_large =
    C.Button.create_button ~size:C.Button.Large ~effect:C.Button.Light "Large and Light"
  in
  let btn_normal =
    C.Button.create_button ~size:C.Button.Normal ~effect:C.Button.Waves "Normal and waves"
  in

  let btn_floating =
    C.Button.create_button ~size:C.Button.Large ~effect:C.Button.Light ~floating:true ~color:"red" ""
  in
  let icon_add = C.Icon.create_icon "add" in
  Dom.appendChild btn_floating icon_add;

  Dom.appendChild col_large btn_large;
  Dom.appendChild col_normal btn_normal;
  Dom.appendChild row col_large;
  Dom.appendChild row col_normal;
  Dom.appendChild container row;
  Dom.appendChild container btn_floating;
  Dom.appendChild Dom_html.document##.body container;
  Js._false

let _  =
  Jsoo_lib.onload onload

