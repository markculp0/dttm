# =========================================
# ||  dttm  ||
# ------------
# An app to display time zone information.
#
# =========================================

library(lubridate)

# Print my tz
Sys.timezone()

# Other Iana tz's
head(OlsonNames())

myNow <- now()
# [1] "2017-09-02 07:51:47 CDT"

# Change how instant in time displayed (UTC val same)
caliTime <-  with_tz(myNow, tzone="America/Los_Angeles")
# [1] "2017-09-02 05:51:47 PDT"

#Change underlying instant in time (UTC val changed)
caliTime2 <-  force_tz(myNow, "America/Los_Angeles")
# [1] "2017-09-02 07:51:47 PDT"

# Current time in Shanghai
shangTime <-  with_tz(now(), tzone="Asia/Shanghai")
shangTime
# [1] "2017-09-02 21:45:59 CST" (China Std Time)

# Current time in India
delhiTime <- with_tz(now(),tzone = "Asia/Kolkata")
delhiTime
# [1] "2017-09-02 19:34:06 IST"





