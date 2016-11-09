module Storylets.Views exposing (..)


import Html exposing (div, text, button)
import Html.Events exposing (onClick)
import Markdown

import Models exposing (Model)
import Storylets.Models exposing (storyletForId, Storylet, StoryDict)
import Events.Models exposing (eventForId, Event, EventDict)

import Messages exposing (Msg(..))


buttonForChoice : EventDict -> Int -> Html.Html Msg
buttonForChoice events eventId =
  let
    event = eventForId events eventId
  in
    div []
    [ button [ onClick (TransitionToEvent event) ] [ text event.title ] ]

buttonsForChoices : EventDict -> List Int -> Html.Html Msg
buttonsForChoices events choices =
  let
    buttons = List.map (buttonForChoice events) choices
  in
    div [] buttons

storyletDiv : Model -> Int -> Html.Html Msg
storyletDiv model storyletId =
    let
      storylet = storyletForId model.storylets storyletId
    in
      div []
      [ Html.h2 [] [ text storylet.title ]
      , Html.p  [] [ Markdown.toHtml [] storylet.body ]
      , buttonsForChoices model.events storylet.events
      ]

onwardsButton : Model -> Event -> Html.Html Msg
onwardsButton model event =
  let
    toStorylet = storyletForId model.storylets event.to
  in
    Html.button [onClick (TransitionToStorylet toStorylet)] [text "Onwards!"]

eventDiv : Model -> Int -> Html.Html Msg
eventDiv model eventId =
  let
    event = eventForId model.events eventId
  in
    div []
    [ Html.h2 [] [ text event.title ]
    , Html.p  [] [ Markdown.toHtml [] event.body ]
    , onwardsButton model event
    ]
