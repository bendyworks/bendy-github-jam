module Storylets.Views exposing (..)

import Html exposing (div, text)
import Markdown

import Models exposing (Model)
import Storylets.Models exposing (storyletForId)
import Messages exposing (Msg)

storyletDiv : Model -> Html.Html Msg
storyletDiv model =
  let
    storylet = storyletForId model.storylets model.currentStorylet
  in
    div []
    [ Html.h2 [] [ text storylet.title ]
    , Html.p  [] [ Markdown.toHtml [] storylet.body ]
    ]
