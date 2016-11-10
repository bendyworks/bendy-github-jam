module Events.Views exposing (..)

import Html exposing (div, text, button)
import Html.Events exposing (onClick)

import Markdown

import Models exposing (Model)
import Events.Models exposing (Event, eventForId)
import Storylets.Models exposing (storyletForId)

import Messages exposing (Msg(..))


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
