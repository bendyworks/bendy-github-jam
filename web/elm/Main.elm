module Main exposing (..)
import Html.App as App

import Models exposing (Model, initModel)
import Messages exposing (Msg)
import Views exposing (view)
import Update exposing (update)

init : ( Model, Cmd Msg )
init =
  ( initModel , Cmd.none )

main : Program Never
main =
  App.program
  { init = init
  , view = view
  , update = update
  , subscriptions = \_ -> Sub.none
  }
