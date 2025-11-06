SELECT
   0 s_0,
   "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Arrival Date" s_1,
   "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Confirmation Number" s_2,
   "Statistics-Reservations Daily"."Bookings - Reservation - Stay Details"."Reservation Type" s_3,
   "Statistics-Reservations Daily"."Property Details"."Property" s_4,
   MONTH("Statistics-Reservations Daily"."Bookings - Reservation - Details"."Arrival Date") s_5,
   YEAR("Statistics-Reservations Daily"."Bookings - Reservation - Details"."Arrival Date") s_6,
    CASE WHEN REPORT_SUM("Statistics-Reservations Daily"."Room Details"."Room Nights" BY "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Confirmation Number")<>0 THEN REPORT_SUM("Statistics-Reservations Daily"."Revenue Details"."Room Revenue" BY "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Confirmation Number")/REPORT_SUM("Statistics-Reservations Daily"."Room Details"."Room Nights" BY "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Confirmation Number") END s_7,
   REPORT_MIN("Statistics-Reservations Daily"."Marketing"."Market Code" BY "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Confirmation Number") s_8,
   REPORT_SUM("Statistics-Reservations Daily"."Revenue Details"."Room Revenue" BY "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Confirmation Number") s_9,
   REPORT_SUM("Statistics-Reservations Daily"."Room Details"."Room Nights" BY "Statistics-Reservations Daily"."Bookings - Reservation - Details"."Confirmation Number") s_10
FROM "Statistics-Reservations Daily"
WHERE
(("Revenue Details"."Room Revenue" > 0) AND ("Marketing"."Market Code" NOT IN ('CMP', 'HSE')) AND ("Bookings - Reservation - Stay Details"."Reservation Type" <> 'CANCEL') AND ("Bookings - Reservation - Details"."Arrival Date" = date '2025-02-01') AND ("Property Details"."Property" = 'BLOOMSB'))
ORDER BY 5 ASC NULLS LAST, 7 ASC NULLS LAST, 6 ASC NULLS LAST, 2 ASC NULLS LAST, 3 ASC NULLS LAST, 8 ASC NULLS LAST, 4 ASC NULLS LAST, 1 ASC NULLS LAST
FETCH FIRST 10000001 ROWS ONLY
