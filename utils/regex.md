## Regex to get the data of the event:
```Shell
cat [error_logs] | grep -E "\\[([a-zA-Z]{3} ){2}[0-9]{2} ([0-9]{2}:){2}[0-9]{2}\.[0-9]{6} [0-9]{4}\\]"
```
