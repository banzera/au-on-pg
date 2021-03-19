SELECT
       stats.relname AS table,
       pg_size_pretty(pg_relation_size(statsio.relid)) AS table_size,
       pg_size_pretty(pg_total_relation_size(statsio.relid) - pg_relation_size(statsio.relid)) AS related_objects_size,
       pg_total_relation_size(statsio.relid) as total_table_size_bytes,
       pg_size_pretty(pg_total_relation_size(statsio.relid)) AS total_table_size,
       stats.n_live_tup AS live_rows


  FROM pg_catalog.pg_statio_user_tables AS statsio
  JOIN pg_stat_user_tables AS stats
 USING (relname)
 WHERE stats.schemaname = current_schema
 UNION ALL
SELECT
       'TOTAL'AS table,
       pg_size_pretty(sum(pg_relation_size(statsio.relid))) AS table_size,
       pg_size_pretty(sum(pg_total_relation_size(statsio.relid) - pg_relation_size(statsio.relid))) AS related_objects_size,
                      sum(pg_total_relation_size(statsio.relid)) as total_table_size_bytes,
       pg_size_pretty(sum(pg_total_relation_size(statsio.relid))) AS total_table_size,
       sum(stats.n_live_tup) AS live_rows
  FROM pg_catalog.pg_statio_user_tables AS statsio
  JOIN pg_stat_user_tables AS stats
 USING (relname)
 WHERE stats.schemaname = current_schema
 ORDER BY total_table_size_bytes ASC
;
