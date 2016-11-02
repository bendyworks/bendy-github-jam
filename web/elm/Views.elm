module Views exposing (..)

import Html exposing (div, text)
import Models exposing (Model)
import Storylets.Views exposing (storyletDiv)
import Messages exposing (Msg)

view : Model -> Html.Html Msg
view model =
  Html.div [] [ text "Hello there bendyperson!"
              , div [] [
                text ("You have " ++
                      (toString model.inventory.rubies) ++
                      " rubies!")
              , storyletDiv model
              ]]
