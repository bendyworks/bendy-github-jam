module Storylets.Views exposing (..)


import Html exposing (div, text, button)
import Html.Events exposing (onClick)
import Markdown

import Models exposing (Model)
import Storylets.Models exposing (storyletForId, Storylet, StoryDict)
import Messages exposing (Msg(..))


buttonForChoice : StoryDict -> Int -> Html.Html Msg
buttonForChoice stories eventId =
  let
    storylet = storyletForId stories eventId
  in
    div []
    [ button [ onClick (TransitionTo storylet) ] [ text storylet.title ] ]

buttonsForChoices : StoryDict -> List Int -> Html.Html Msg
buttonsForChoices stories choices =
  let
    buttons = List.map (buttonForChoice stories) choices
  in
    div [] buttons

storyletDiv : Model -> Html.Html Msg
storyletDiv model =
  let
    storylet = storyletForId model.storylets model.currentStorylet
  in
    div []
    [ Html.h2 [] [ text storylet.title ]
    , Html.p  [] [ Markdown.toHtml [] storylet.body ]
    , buttonsForChoices model.storylets storylet.choices
    ]
