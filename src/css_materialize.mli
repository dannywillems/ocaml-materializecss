type doc
val document : doc

(* -------------------------------------------------------------------------- *)
module Head :
  sig
    type css_link     =
      | Bower_css
      | Link_css of string

    type jquery_link  =
      | Bower_jquery
      | Link_jquery of string

    type js_link      =
      | Bower_js
      | Link_js of string

    val add_css_materialize           :
      css_link    ->
      Eliom_content.Html.D.link

    val add_js_jquery                 :
      jquery_link ->
      Eliom_content.Html.D.script

    val add_js_materialize            :
      js_link     ->
      Eliom_content.Html.D.script

    val add_icons                     :
      string      ->
      Eliom_content.Html.D.link
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

    val create_icon :
      ?size:size                                            ->
      ?a:Html_types.i_attrib Eliom_content.Html.attrib list ->
      ?classes:string list                                  ->
      string                                                ->
      Eliom_content.Html.D.i
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Grid :
  sig
    val create_container  :   ?classes:string list          ->
                              ?a:Html_types.div_attrib Eliom_content.Html.attrib
                              list                          ->
                              unit                          ->
                              Eliom_content.Html.D.div

    val create_row        :   ?class_name:string            ->
                              ?childs:#Dom.node Js.t list  ->
                              string                      ->
                              Dom_html.divElement Js.t

    val create_col        :   ?lg:int                     ->
                              ?md:int                     ->
                              ?xs:int                     ->
                              ?offset_lg:int              ->
                              ?offset_md:int              ->
                              ?offset_xs:int              ->
                              ?class_name:string           ->
                              ?childs:#Dom.node Js.t list  ->
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
                              ?class_name:string           ->
                              string                      ->
                              Dom_html.anchorElement Js.t
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Color :
  sig
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

    val to_str : t -> string
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Badges *)
module Badges :
  sig
    (* See http://materializecss.com/badges.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Cards *)
module Cards :
  sig
    (* http://materializecss.com/cards.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Chips *)
module Chips :
  sig
    (* http://materializecss.com/chips.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Collections *)
module Collections :
  sig
    (* See http://materializecss.com/collections.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Footer *)
module Footer :
  sig
    (* See http://materializecss.com/footer.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Forms *)
module Forms :
  sig
    type input =
      | Button
      | Checkbox
      | Color
      | Date
      | Datetime
      | Datetime_local
      | Email
      | File
      | Hidden
      | Image
      | Month
      | Number
      | Password
      | Radio
      | Range
      | Reset
      | Search
      | Submit
      | Tel
      | Text
      | Time
      | Url
      | Week

    (*
    val create_form         :   ?lg:int                     ->
                                ?md:int                     ->
                                ?xs:int                     ->
                                ?offset_lg:int              ->
                                ?offset_md:int              ->
                                ?offset_xs:int              ->
                                ?class_name:string          ->
                                ?childs:#Dom.node Js.t list  ->
                                string ->
                                Dom_html.formElement Js.t
    *)

    val create_input_field  :   ?lg:int                             ->
                                ?md:int                             ->
                                ?xs:int                             ->
                                ?offset_lg:int                      ->
                                ?offset_md:int                      ->
                                ?offset_xs:int                      ->
                                ?class_name:string                  ->
                                ?childs:#Dom.node Js.t list  ->
                                string                              ->
                                Dom_html.divElement Js.t

    val create_input        :   ?id:string ->
                                ?enable:bool ->
                                ?placeholder:string ->
                                ?value:string ->
                                ?validate:bool ->
                                ?class_name:string ->
                                ?childs:#Dom.node Js.t list  ->
                                input ->
                                Dom_html.inputElement Js.t

    val create_label        :   ?_for:string ->
                                ?class_name:string ->
                                ?active:bool ->
                                ?data_error:string ->
                                ?data_success:string ->
                                ?childs:#Dom.node Js.t list  ->
                                string ->
                                Dom_html.labelElement Js.t

    val create_textarea     :   ?id:string ->
                                ?class_name:string ->
                                ?autofocus:bool ->
                                ?cols:int ->
                                ?disabled:bool ->
                                ?max_length:int ->
                                ?placeholder:string ->
                                ?read_only:bool ->
                                ?rows:int ->
                                ?required:bool ->
                                unit ->
                                Dom_html.textAreaElement Js.t

    val create_switches     :   ?text_disable:string ->
                                ?text_enable:string ->
                                bool ->
                                Dom_html.divElement Js.t


    (* See http://materializecss.com/forms.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Navbar *)
module Navbar :
  sig
    (* See http://materializecss.com/navbar.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Paginatior *)
module Pagination :
  sig
    (* See http://materializecss.com/pagination.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Preloader *)
module Preloader :
  sig
    (* See http://materializecss.com/preloader.html *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Collapsible :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Dialogs :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Dropdown :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Media :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Modals :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Parallax :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Pushpin :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module ScrollFire :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Scrollspy :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module SideNav :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Tabs :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Transitions :
  sig
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Waves :
  sig
  end
(* -------------------------------------------------------------------------- *)
