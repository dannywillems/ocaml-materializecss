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

(* -------------------------------------------------------------------------- *)
module Color =
  struct
    type t =
      (* Red *)
      | Red_lighten_5
      | Red_lighten_4
      | Red_lighten_3
      | Red_lighten_2
      | Red_lighten_1
      | Red
      | Red_darken_4
      | Red_darken_3
      | Red_darken_2
      | Red_darken_1
      | Red_accent_1
      | Red_accent_2
      | Red_accent_3
      | Red_accent_4
      (* Pink *)
      | Pink_lighten_5
      | Pink_lighten_4
      | Pink_lighten_3
      | Pink_lighten_2
      | Pink_lighten_1
      | Pink
      | Pink_darken_4
      | Pink_darken_3
      | Pink_darken_2
      | Pink_darken_1
      | Pink_accent_1
      | Pink_accent_2
      | Pink_accent_3
      | Pink_accent_4
      (* Purple *)
      | Purple_lighten_5
      | Purple_lighten_4
      | Purple_lighten_3
      | Purple_lighten_2
      | Purple_lighten_1
      | Purple
      | Purple_darken_4
      | Purple_darken_3
      | Purple_darken_2
      | Purple_darken_1
      | Purple_accent_1
      | Purple_accent_2
      | Purple_accent_3
      | Purple_accent_4
      (* Deep purple *)
      | Deep_purple_lighten_5
      | Deep_purple_lighten_4
      | Deep_purple_lighten_3
      | Deep_purple_lighten_2
      | Deep_purple_lighten_1
      | Deep_purple
      | Deep_purple_darken_4
      | Deep_purple_darken_3
      | Deep_purple_darken_2
      | Deep_purple_darken_1
      | Deep_purple_accent_1
      | Deep_purple_accent_2
      | Deep_purple_accent_3
      | Deep_purple_accent_4
      (* Indigo *)
      | Indigo_lighten_5
      | Indigo_lighten_4
      | Indigo_lighten_3
      | Indigo_lighten_2
      | Indigo_lighten_1
      | Indigo
      | Indigo_darken_4
      | Indigo_darken_3
      | Indigo_darken_2
      | Indigo_darken_1
      | Indigo_accent_1
      | Indigo_accent_2
      | Indigo_accent_3
      | Indigo_accent_4
      (* Blue *)
      | Blue_lighten_5
      | Blue_lighten_4
      | Blue_lighten_3
      | Blue_lighten_2
      | Blue_lighten_1
      | Blue
      | Blue_darken_4
      | Blue_darken_3
      | Blue_darken_2
      | Blue_darken_1
      | Blue_accent_1
      | Blue_accent_2
      | Blue_accent_3
      | Blue_accent_4
      (* Light-blue *)
      (* Cyan *)
      (* Teal *)
      (* Green *)
      (* Light green *)
      (* Lime *)
      (* Yellow *)
      (* Amber *)
      (* Orange *)
      (* Deep-orange *)
      (* Brown !! No accent !! *)
      (* Grey !! No accent !! *)
      (* Blue-grey !! No accent !! *)
      | Black
      | White
      | Transparent

    let to_str s = match s with
      (* Red *)
      | Red_lighten_5           -> "red lighten-5"
      | Red_lighten_4           -> "red lighten-4"
      | Red_lighten_3           -> "red lighten-3"
      | Red_lighten_2           -> "red lighten-2"
      | Red_lighten_1           -> "red lighten-1"
      | Red                     -> "red"
      | Red_darken_4            -> "red darken-4"
      | Red_darken_3            -> "red darken-3"
      | Red_darken_2            -> "red darken-2"
      | Red_darken_1            -> "red darken-1"
      | Red_accent_1            -> "red accent-1"
      | Red_accent_2            -> "red accent-2"
      | Red_accent_3            -> "red accent-3"
      | Red_accent_4            -> "red accent-4"
      (* Pink *)
      | Pink_lighten_5          -> "pink lighten-5"
      | Pink_lighten_4          -> "pink lighten-4"
      | Pink_lighten_3          -> "pink lighten-3"
      | Pink_lighten_2          -> "pink lighten-2"
      | Pink_lighten_1          -> "pink lighten-1"
      | Pink                    -> "pink"
      | Pink_darken_4           -> "pink darken-4"
      | Pink_darken_3           -> "pink darken-3"
      | Pink_darken_2           -> "pink darken-2"
      | Pink_darken_1           -> "pink darken-1"
      | Pink_accent_1           -> "pink accent-1"
      | Pink_accent_2           -> "pink accent-2"
      | Pink_accent_3           -> "pink accent-3"
      | Pink_accent_4           -> "pink accent-4"
      (* Purple *)
      | Purple_lighten_5        -> "purple lighten-5"
      | Purple_lighten_4        -> "purple lighten-4"
      | Purple_lighten_3        -> "purple lighten-3"
      | Purple_lighten_2        -> "purple lighten-2"
      | Purple_lighten_1        -> "purple lighten-1"
      | Purple                  -> "purple"
      | Purple_darken_4         -> "purple darken-4"
      | Purple_darken_3         -> "purple darken-3"
      | Purple_darken_2         -> "purple darken-2"
      | Purple_darken_1         -> "purple darken-1"
      | Purple_accent_1         -> "purple accent-1"
      | Purple_accent_2         -> "purple accent-2"
      | Purple_accent_3         -> "purple accent-3"
      | Purple_accent_4         -> "purple accent-4"
      (* Deep purple *)
      | Deep_purple_lighten_5   -> "deep-purple lighten-5"
      | Deep_purple_lighten_4   -> "deep-purple lighten-4"
      | Deep_purple_lighten_3   -> "deep-purple lighten-3"
      | Deep_purple_lighten_2   -> "deep-purple lighten-2"
      | Deep_purple_lighten_1   -> "deep-purple lighten-1"
      | Deep_purple
      | Deep_purple_darken_4    -> "deep-purple darken-4"
      | Deep_purple_darken_3    -> "deep-purple darken-3"
      | Deep_purple_darken_2    -> "deep-purple darken-2"
      | Deep_purple_darken_1    -> "deep-purple darken-1"
      | Deep_purple_accent_1    -> "deep-purple accent-1"
      | Deep_purple_accent_2    -> "deep-purple accent-2"
      | Deep_purple_accent_3    -> "deep-purple accent-3"
      | Deep_purple_accent_4    -> "deep-purple accent-4"
      (* Indigo *)
      | Indigo_lighten_5        -> "indigo lighten-5"
      | Indigo_lighten_4        -> "indigo lighten-4"
      | Indigo_lighten_3        -> "indigo lighten-3"
      | Indigo_lighten_2        -> "indigo lighten-2"
      | Indigo_lighten_1        -> "indigo lighten-1"
      | Indigo                  -> "indigo"
      | Indigo_darken_4         -> "indigo darken-4"
      | Indigo_darken_3         -> "indigo darken-3"
      | Indigo_darken_2         -> "indigo darken-2"
      | Indigo_darken_1         -> "indigo darken-1"
      | Indigo_accent_1         -> "indigo accent-1"
      | Indigo_accent_2         -> "indigo accent-2"
      | Indigo_accent_3         -> "indigo accent-3"
      | Indigo_accent_4         -> "indigo accent-4"
      (* Blue *)
      | Blue_lighten_5          -> "blue lighten-5"
      | Blue_lighten_4          -> "blue lighten-4"
      | Blue_lighten_3          -> "blue lighten-3"
      | Blue_lighten_2          -> "blue lighten-2"
      | Blue_lighten_1          -> "blue lighten-1"
      | Blue                    -> "blue"
      | Blue_darken_4           -> "blue darken-4"
      | Blue_darken_3           -> "blue darken-3"
      | Blue_darken_2           -> "blue darken-2"
      | Blue_darken_1           -> "blue darken-1"
      | Blue_accent_1           -> "blue accent-1"
      | Blue_accent_2           -> "blue accent-2"
      | Blue_accent_3           -> "blue accent-3"
      | Blue_accent_4           -> "blue accent-4"
      (* Light-blue *)
      (* Cyan *)
      (* Teal *)
      (* Green *)
      (* Light green *)
      (* Lime *)
      (* Yellow *)
      (* Amber *)
      (* Orange *)
      (* Deep-orange *)
      (* Brown !! No accent !! *)
      (* Grey !! No accent !! *)
      (* Blue-grey !! No accent !! *)
      | Black                   -> "black"
      | White                   -> "white"
      | Transparent             -> "transparent"

  end
(* -------------------------------------------------------------------------- *)
