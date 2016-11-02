module Update exposing (..)

import Messages exposing (Msg)
import Models exposing (Model)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = (model, Cmd.none)
