module Show exposing (..)

import Types as T
import Time


-- SHOW DATES

zone : Time.Zone
zone = Time.utc

fullDate : T.Date -> String
fullDate d =
    String.join " "
        [ String.fromInt <| Time.toDay zone d
        , month <| Time.toMonth zone d
        , String.fromInt <| Time.toYear zone d
        ]

year : T.Date -> String
year d =
    String.fromInt <| Time.toYear zone d

month : Time.Month -> String
month m =
    case m of
        Time.Jan -> "Gennaio"
        Time.Feb -> "Febbraio"
        Time.Mar -> "Marzo"
        Time.Apr -> "Aprile"
        Time.May -> "Maggio"
        Time.Jun -> "Giugno"
        Time.Jul -> "Luglio"
        Time.Aug -> "Agosto"
        Time.Sep -> "Settembre"
        Time.Oct -> "Ottobre"
        Time.Nov -> "Novembre"
        Time.Dec -> "Dicembre"