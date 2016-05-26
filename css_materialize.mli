type doc
val document : doc

(* -------------------------------------------------------------------------- *)
module Head :
  sig
    type css_link     = Bower_css | Link_css of string
    type jquery_link  = Bower_jquery | Link_jquery of string
    type js_link      = Bower_js | Link_js of string

    val add_css_materialize           :   css_link    -> unit
    val add_js_jquery                 :   jquery_link -> unit
    val add_js_materialize            :   js_link     -> unit
    val add_icons                     :   string      -> unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Icon :
  sig
    type size =
      | Tiny
      | Small
      | Medium
      | Large
      | Normal

    (* Need to list all icons. See https://design.google.com/icons/ *)
    (*
    type icon =
      | Add
      | Info_outline
    *)

    val create_icon : ?size:size -> string -> Dom_html.element Js.t
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Grid :
  sig
    val create_container  :   ?className:string           ->
                              string                      ->
                              Dom_html.divElement Js.t

    val create_row        :   ?className:string           ->
                              string                      ->
                              Dom_html.divElement Js.t

    val create_col        :   ?lg:int                     ->
                              ?md:int                     ->
                              ?xs:int                     ->
                              ?offset_lg:int              ->
                              ?offset_md:int              ->
                              ?offset_xs:int              ->
                              ?className:string           ->
                              string                      ->
                              Dom_html.divElement Js.t
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Button :
  sig
    type btn_size = Large | Normal
    type btn_effect = Waves | Teal | Light | No_effect

    val create_button     :   ?size:btn_size              ->
                              ?effect:btn_effect          ->
                              ?enable:bool                ->
                              ?color:string               -> (* Use sum type !! *)
                              ?floating:bool              ->
                              ?flat:bool                  ->
                              ?className:string           ->
                              string                      ->
                              Dom_html.anchorElement Js.t
  end
(* -------------------------------------------------------------------------- *)
