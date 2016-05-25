module C = Css_materialize

let _ =
  let container = C.create_container "I'm a container" in
  let row = C.create_row "I'm a row" in
  let col1 = C.create_col ~lg:3 "Hello world" in
  let col2 = C.create_col ~lg:3 "Hello world" in
  let col3 = C.create_col ~lg:3 "Hello world" in
  let col4 = C.create_col ~lg:3 "Hello world" in

  Dom.appendChild row col1;
  Dom.appendChild row col2;
  Dom.appendChild row col3;
  Dom.appendChild row col4;
  Dom.appendChild container row;
  Dom.appendChild Dom_html.document##.body container
