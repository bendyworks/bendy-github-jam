module Main exposing (..)

import Html as App
import Models exposing (Model, initModel)
import Messages exposing (Msg)
import Views exposing (view)
import Update exposing (update)


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )


main : Program Never Model Msg
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
