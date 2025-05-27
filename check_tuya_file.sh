#!/bin/bash

TARGET="/config/custom_components/tuya_local/devices/tadiran_wind_heatpump.yaml"
SOURCE="/config/protected_files/tuya_restore/tadiran_wind_heatpump.yaml"
LOGFILE="/config/protected_files/tuya_restore/tuya_restore.log"

mkdir -p "$(dirname "$LOGFILE")"

echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] מתחיל בדיקת קובץ" | tee -a "$LOGFILE"

if [ ! -f "$TARGET" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] הקובץ לא נמצא. משחזר מגיבוי..." | tee -a "$LOGFILE"
    cp "$SOURCE" "$TARGET"
    if [ $? -eq 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] הקובץ הועתק בהצלחה." | tee -a "$LOGFILE"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] קרתה שגיאה במהלך ההעתקה." | tee -a "$LOGFILE"
    fi
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] הקובץ קיים. אין צורך בשחזור." | tee -a "$LOGFILE"
fi
