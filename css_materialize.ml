(* -------------------------------------------------------------------------- *)
type doc = Dom_html.document Js.t

let document = Dom_html.document
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Head =
  struct
    type css_link     = Bower_css | Link_css of string
    type jquery_link  = Bower_jquery | Link_jquery of string
    type js_link      = Bower_js | Link_js of string

    let add_css_materialize href  =
      let l = match href with
      | Bower_css -> "bower_components/Materialize/dist/css/materialize.min.css"
      | Link_css x -> x
      in Jsoo_lib.Head.add_css_link l

    let add_js_jquery href =
      let l = match href with
      | Bower_jquery -> "bower_components/jquery/dist/jquery.min.js"
      | Link_jquery x -> x
      in Jsoo_lib.Head.add_js_script l

    let add_js_materialize href =
      let l = match href with
      | Bower_js -> "bower_components/Materialize/dist/js/materialize.min.js"
      | Link_js x -> x
      in Jsoo_lib.Head.add_js_script l

    let add_icons link =
      Jsoo_lib.Head.add_link ~rel:Jsoo_lib.Head.Stylesheet link
  end

module Icon =
  struct
    type size =
      | Tiny
      | Small
      | Medium
      | Large
      | Normal

    let size_to_str s = match s with
    | Tiny -> "tiny"
    | Small -> "small"
    | Medium -> "medium"
    | Large -> "large"
    | Normal -> ""

    let create_icon ?(size=Normal) content =
      let i = Dom_html.createI document in
      i##.className := Js.string ((size_to_str size) ^ "material-icons");
      i##.innerHTML := (Js.string content);
      i
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Grid =
  struct
    let create_container ?(className="") content =
      let div = Dom_html.createDiv document in
      div##.innerHTML := Js.string content;
      div##.className := Js.string ("container " ^ className);
      div

    let create_row ?(className="") content =
      let div = Dom_html.createDiv document in
      div##.innerHTML := Js.string content;
      div##.className := Js.string ("row " ^ className);
      div

    type col_size = Lg of int | Md of int | Xs of int

    let col_offset_to_str c = match c with
      | Lg x when x > 0 -> "offset-l" ^ string_of_int x
      | Md x when x > 0 -> "offset-m" ^ string_of_int x
      | Xs x when x > 0 -> "offset-s" ^ string_of_int x
      | _ -> ""

    let col_size_to_str c =
      match c with
      | Lg x when x > 0 -> "l" ^ string_of_int x
      | Md x when x > 0 -> "m" ^ string_of_int x
      | Xs x when x > 0 -> "s" ^ string_of_int x
      | _ -> ""

    let rec col_size_list_to_str l = match l with
      | [] -> ""
      | a::tail -> (col_size_to_str a) ^ (col_size_list_to_str tail)

    let rec col_offset_list_to_str l = match l with
      | [] -> ""
      | a::tail -> (col_offset_to_str a) ^ " " ^ (col_offset_list_to_str tail)

    (** Need an offset for each size. Need an array of screen_size *)
    let create_col ?(lg=0) ?(md=0) ?(xs=0)
      ?(offset_lg=0) ?(offset_md=0) ?(offset_xs=0) ?(className="") content =
      let div = Dom_html.createDiv document in
      let size = (col_size_list_to_str [Lg lg ; Md md ; Xs xs]) in
      let offset = (col_offset_list_to_str [Lg offset_lg ; Md offset_md ; Xs offset_xs]) in

      div##.innerHTML := Js.string content;
      div##.className := Js.string ("col " ^ size ^ " " ^ offset ^ " " ^ className);
      (* Add class depending on offset and screen size *)
      div
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Button *)
module Button =
  struct
    type btn_size = Large | Normal
    type btn_effect = Waves | Teal | Light | No_effect

    let btn_size_to_str s = match s with
      | Large -> "btn-large"
      | Normal -> "btn"

    let btn_effect_to_str s = match s with
      | Waves -> "waves-effect"
      | Teal -> "waves-effect waves-teal"
      | Light -> "waves-effect waves-light"
      | No_effect -> ""

    let btn_enable_to_str s = if s then "" else "disabled"

    let btn_position_to_str s = if s then "btn-floating" else ""

    let btn_flat_to_str s = if s then "btn-flat" else ""

    let btn_prop_to_str size effect enable floating flat =
      (btn_size_to_str size) ^ " " ^ (btn_effect_to_str effect) ^ " " ^
      (btn_enable_to_str enable) ^ " " ^ (btn_position_to_str floating) ^ " " ^
      (btn_flat_to_str flat)

    let create_button ?(size=Normal) ?(effect=No_effect) ?(enable=true)
      ?(color="") ?(floating=false) ?(flat=false) ?(className="") content =
      let a = Dom_html.createA document in
      a##.innerHTML := Js.string content;
      a##.className := Js.string ((btn_prop_to_str size effect enable floating flat) ^ " " ^
      color ^ " " ^ className);
      a
  end
(* -------------------------------------------------------------------------- *)
