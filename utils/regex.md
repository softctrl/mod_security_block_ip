## Regex to get the data of the event:
```Shell
cat [error_logs] | grep -E "\\[([a-zA-Z]{3} ){2}[0-9]{2} ([0-9]{2}:){2}[0-9]{2}\.[0-9]{6} [0-9]{4}\\]"
```
## Regex to get the pid of the proccess:
```Shell
cat [error_logs] | grep -E "\\[pid [0-9]*\\] "
```
## Regex to get the URI of the event:
```Shell
cat [error_logs] | grep -oE "\\[uri \"\/.*\"\\] " | grep # | grep -E "\"\/.*\""
```
