
# Не допускаем повторного запуска скрипта из cron
Результатом должно быть исполнение index.php с параметром и не допустить одновременного исполнения нескольких экземпляров

### Цепочка исполнения 
cron -> /scripts/cron/cron_tps_check.sh testcommand id1 -> Проверка запущен ли процесс, если нет то -> index.php testcommand 

### Пример cron задач
```
*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand id1
*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand2 id2
*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand3 id3
*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand4 id4
```
2-й параметр id1,id2... должен быть уникальным, по нему отслеживается процесс

### Пример лога работы
```
2017-03-03 14:16:01 [RES ] testcommand - command testcommand successfuly completed, timeout 76
2017-03-03 14:17:01 [RES ] testcommand4 - command testcommand4 successfuly completed, timeout 41
2017-03-03 14:18:01 [WARN] testcommand3 - is already running
2017-03-03 14:18:01 [WARN] testcommand2 - is already running
2017-03-03 14:17:01 [RES ] testcommand3 - command testcommand3 successfuly completed, timeout 70
2017-03-03 14:17:01 [RES ] testcommand2 - command testcommand2 successfuly completed, timeout 110
2017-03-03 14:19:01 [WARN] testcommand - is already running
2017-03-03 14:19:01 [WARN] testcommand4 - is already running
2017-03-03 14:18:01 [RES ] testcommand4 - command testcommand4 successfuly completed, timeout 67
2017-03-03 14:19:01 [RES ] testcommand2 - command testcommand2 successfuly completed, timeout 23
 ```
