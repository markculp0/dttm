# =========================================
# | dttm |
# --------
# An app to display time zone information.
#
# =========================================

library(lubridate)

# Print my tz
Sys.timezone()

# Other Iana tz's
head(OlsonNames())

myNow <- now()

# Change how instant in time displayed (UTC val same)
caliTime <-  with_tz(myNow, tzone="America/Los_Angeles")

#Change underlying instant in time (UTC val changed)
caliTime2 <-  force_tz(myNow, "America/Los_Angeles")


