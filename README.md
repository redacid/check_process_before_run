# check_process_before_run
Не допускаем повторного запуска скрипта из cron

*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand id1
*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand2 id2
*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand3 id3
*/1 *   * * *   root    /scripts/cron/cron_tps_check.sh testcommand4 id4

2-й параметр id1,id2... должен быть уникальным, по нему отслеживается процесс
