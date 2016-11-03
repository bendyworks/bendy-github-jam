module Messages exposing (..)

import Models exposing (Activity)
import Storylets.Models exposing (Storylet)

type Msg =
  TransitionTo Storylet
  | SetActivity Activity
  | Noop
