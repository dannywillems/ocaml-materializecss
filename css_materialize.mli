type doc
val document : doc


(* -------------------------------------------------------------------------- *)
val create_container  :   ?className:string           ->
                          string                      ->
                          Dom_html.divElement Js.t
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val create_row        :   ?className:string           ->
                          string                      ->
                          Dom_html.divElement Js.t
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val create_col        :   ?lg:int                     ->
                          ?md:int                     ->
                          ?xs:int                     ->
                          ?offset_lg:int              ->
                          ?offset_md:int              ->
                          ?offset_xs:int              ->
                          ?className:string           ->
                          string                      ->
                          Dom_html.divElement Js.t
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type btn_size
type btn_effect

val create_button     :   ?size:btn_size              ->
                          ?effect:btn_effect          ->
                          ?enable:bool                ->
                          ?color:string               -> (* Use sum type !! *)
                          ?floating:bool              ->
                          ?flat:bool                  ->
                          ?className:string           ->
                          string                      ->
                          Dom_html.linkElement Js.t
(* -------------------------------------------------------------------------- *)
