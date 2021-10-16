module Ui.Keyed exposing (el, column, row)

{-| Notes from the `Html.Keyed` on how keyed works:

---

A keyed node helps optimize cases where children are getting added, moved, removed, etc. Common examples include:

  - The user can delete items from a list.
  - The user can create new items in a list.
  - You can sort a list based on name or date or whatever.

When you use a keyed node, every child is paired with a string identifier. This makes it possible for the underlying diffing algorithm to reuse nodes more efficiently.

This means if a key is changed between renders, then the diffing step will be skipped and the node will be forced to rerender.

---

@docs el, column, row

-}

import Internal.Model2 as Two
import Internal.Style2 as Style
import Ui exposing (Attribute, Element)


{-| -}
el : List (Attribute msg) -> ( String, Element msg ) -> Element msg
el attrs child =
    Two.elementKeyed Two.AsEl attrs [ child ]


{-| -}
row : List (Attribute msg) -> List ( String, Element msg ) -> Element msg
row =
    Two.elementKeyed Two.AsRow


{-| -}
column : List (Attribute msg) -> List ( String, Element msg ) -> Element msg
column =
    Two.elementKeyed Two.AsColumn
