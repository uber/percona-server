.. _process_list:

=============
Process List
=============

This page describes Percona changes to both the standard |MySQL| ``SHOW PROCESSLIST`` command and the standard |MySQL| ``INFORMATION_SCHEMA`` table ``PROCESSLIST``.

The changes that have been made as of version 5.6 of the server are:

  * :table:`PROCESSLIST` table:

    * added column ``TIME_MS``

Version Specific Information
============================

  * :rn:`5.6.5-60.0`:

    * Added column ``TIME_MS`` to table ``PROCESSLIST``.

  * :rn:`5.6.11-60.3`:

    * Added ``ROWS_SENT`` and ``ROWS_EXAMINED`` columns to table ``PROCESSLIST``.`

  * :rn:`5.6.27-75.0`

    * Added ``TID`` column to table ``PROCESSLIST``.

INFORMATION_SCHEMA Tables
=========================

.. table:: INFORMATION_SCHEMA.PROCESSLIST

   This table implements modifications to the standard |MySQL| ``INFORMATION_SCHEMA`` table ``PROCESSLIST``.

   :column ID: The connection identifier.
   :column USER: The |MySQL| user who issued the statement.
   :column HOST: The host name of the client issuing the statement.
   :column DB: The default database, if one is selected, otherwise NULL.
   :column COMMAND: The type of command the thread is executing.
   :column TIME: The time in seconds that the thread has been in its current state.
   :column STATE: An action, event, or state that indicates what the thread is doing.
   :column INFO: The statement that the thread is executing, or NULL if it is not executing any statement.
   :column TIME_MS: The time in milliseconds that the thread has been in its current state.
   :column ROWS_EXAMINED: The number of rows examined by the statement being executed (*NOTE:* This column is not updated for each examined row so it does not necessarily show an up-to-date value while the statement is executing. It only shows a correct value after the statement has completed.).
   :column ROWS_SENT: The number of rows sent by the statement being executed.
   :column ROWS_READ: The number of rows read by the statement being executed.
   :column TID: The Linux Thread ID. For Linux, this corresponds to light-weight process ID (LWP ID) and can be seen in the ``ps -L`` output. In case when :ref:`threadpool` is enabled, "TID" is not null for only currently executing statements and statements received via "extra" connection.


Example Output
==============

Table :table:`PROCESSLIST`: ::

  mysql> SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST;

  +----+------+-----------+--------------------+---------+------+-----------+---------------------------+---------+-----------+---------------+
  | ID | USER | HOST      | DB                 | COMMAND | TIME | STATE     | INFO                      | TIME_MS | ROWS_SENT | ROWS_EXAMINED |
  +----+------+-----------+--------------------+---------+------+-----------+---------------------------+---------+-----------+---------------+
  | 12 | root | localhost | information_schema | Query   |    0 | executing | select * from processlist |       0 |         0 |             0 |
  +----+------+-----------+--------------------+---------+------+-----------+---------------------------+---------+-----------+---------------+

