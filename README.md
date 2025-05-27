# 🛠 מדריך: אוטומציה לשחזור מזגן תדיראן באינטגרציית Tuya Local לאחר אתחול Home Assistant

<br> במדריך זה ניצור אוטומציה שתבדוק בכל עלייה של Home Assistant אם קובץ ההתקן של מזגן תדיראן נמחק מהאינטגרציה tuya_local. 
<br> אם הקובץ נמחק (לרוב עקב עדכון האינטגרציה) – הסקריפט ישחזר אותו אוטומטית מתיקיית גיבוי.
<br> כך תוכל לשדרג את Tuya Local בלי לדאוג למחיקת הקובץ.


## 📁 שלב 1: יצירת תיקיית גיבוי 
ניצור את התיקייה:<br>
`/config/protected_files/tuya_restore`




## 📄 שלב 2: הוספת 3 קבצים לתיקייה
שים בתיקייה את הקבצים הבאים (מצורפים):
<br><br>`check_tuya_file.sh`
<br>&nbsp;&nbsp;&nbsp;&nbsp;סקריפט שמבצע את הבדיקה והשחזור<br>
<br>`tuya_restore.log`
<br>&nbsp;&nbsp;&nbsp;&nbsp;קובץ לוג שמתעד את פעולת הסקריפט<br>
<br>`tadiran_wind_heatpump.yaml`
<br>&nbsp;&nbsp;&nbsp;&nbsp;קובץ ההתקן שצריך לשחזר<br>




## 🔒 שלב 3: מתן הרשאות הרצה לסקריפט ותיקון שגיאת סוג קובץ

בטרמינל של Home Assistant, הרץ:
```bash
chmod +x /config/protected_files/tuya_restore/check_tuya_file.sh
```
<br>ואז את זה:
```bash
dos2unix /config/protected_files/tuya_restore/check_tuya_file.sh
```



## ⚙️ שלב 4: הגדרת shell_command

פתח את הקובץ configuration.yaml והוסף:
```yaml
shell_command:
  restore_tuya_file: /bin/bash /config/protected_files/tuya_restore/check_tuya_file.sh
```
<br>שמור את הקובץ ואתחל את המערכת או טען מחדש את ההגדרות.



## 🤖 שלב 5: יצירת אוטומציה ב־UI
- עבור אל הגדרות
- בחר אוטומציות וסצנות
- לחץ + יצירת אוטומציה
- גורם מפעיל: כאשר Home Assistant מופעל
- פעולה: shell_command.restore_tuya_file
- שמור את האוטומציה



## ✅ שלב 6: בדיקה ידנית
- עבור אל כלים למפתחים
- לשונית שירותים
- בחר shell_command.restore_tuya_file
- לחץ ביצוע שירות



## בדיקת הצלחה:
- בדוק אם הקובץ נוסף לתיקייה:
`/config/custom_components/tuya_local/devices/`
- פתח את קובץ הלוג:
`/config/protected_files/tuya_restore/tuya_restore.log`
אם הכל תקין, תראה שם את ההודעות שנכתבו.



### 🙏 תודות
- תודה מיוחדת ל־[@dmatik](https://github.com/dmatik) ששמר את הקובץ עבור כולנו וסיפק תמיכה בנושא.
- תודה ל־[@OpenAI](https://openai.com/chatgpt) ול־**ChatGPT** על הסיוע לאורך כל הדרך.  
