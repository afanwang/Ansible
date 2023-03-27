/* CQL3 is not supported by DBeaver and OpsCenter at this moment. Commented for now */
/* TEST */
/*How to import ddl into cassandra*/
/*run python cqlsh -f <path_to_schema>/schema.ddl*/

CREATE KEYSPACE DataAnalytics WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE DataAnalytics;

/*
 * Raw event data tables
 * 
 */
DROP TABLE device_events;
CREATE TABLE device_events (
  location_id ascii,
  date timestamp,
  id_key timeuuid,
  device_id ascii,
  event_type ascii,
  app_id ascii,
  user_id ascii,
  client_ip ascii,
  payload map<text, text>,
  PRIMARY KEY (location_id, date, id_key)
) WITH CLUSTERING ORDER BY (date ASC);
CREATE INDEX ON device_events(device_id);
CREATE INDEX ON device_events(app_id);
CREATE INDEX ON device_events(user_id);
CREATE INDEX ON device_events(event_type);


DROP TABLE user_events;
CREATE TABLE user_events (
  location_id ascii,
  date timestamp,
  event_type ascii,
  id_key timeuuid,
  device_id ascii,
  app_id ascii,
  user_id ascii,
  client_ip ascii,
  payload map<text, text>,  
  PRIMARY KEY (location_id, date, id_key)
) WITH CLUSTERING ORDER BY (date ASC);
CREATE INDEX ON user_events(device_id);
CREATE INDEX ON user_events(app_id);
CREATE INDEX ON user_events(user_id);
CREATE INDEX ON user_events(event_type);


DROP TABLE staff_events;
CREATE TABLE staff_events (
  location_id ascii,
  date timestamp,
  event_type ascii,
  id_key timeuuid,
  app_id ascii,
  user_id ascii,
  client_ip ascii,
  payload map<text, text>,  
  PRIMARY KEY (location_id, date, id_key)
) WITH CLUSTERING ORDER BY (date ASC);
CREATE INDEX ON staff_events(app_id);
CREATE INDEX ON staff_events(user_id);
CREATE INDEX ON staff_events(event_type);


DROP TABLE server_events;
CREATE TABLE server_events (
  location_id ascii,
  date timestamp,
  event_type ascii,
  id_key timeuuid,
  app_id ascii,
  user_id ascii,
  client_ip ascii,
  payload map<text, text>,  
  PRIMARY KEY (location_id, date, id_key)
) WITH CLUSTERING ORDER BY (date ASC);
CREATE INDEX ON server_events(app_id);
CREATE INDEX ON server_events(user_id);
CREATE INDEX ON server_events(event_type);

/*
 * Real-time indexes and pre-processed data
 * 
 */

DROP TABLE locations;
CREATE TABLE locations (
  location_id ascii,
  location_name ascii,
  timezone ascii,
  PRIMARY KEY (location_id)
);


DROP TABLE device_status;
CREATE TABLE device_status (
  location_id ascii,
  device_id ascii,
  bundle_version ascii,
  last_critical_event_type ascii,
  last_critical_event_date timestamp,
  last_event_type ascii,
  last_event_date timestamp,
  last_login_date timestamp,
  battery_status double,
  cpu_usage double,
  ram_usage double,
  uptime double,
  latitude double,
  longitude double,
  PRIMARY KEY (location_id, device_id)
);


/*
 * Batch processing tables
 * 
 */
DROP TABLE device_stats;
CREATE TABLE device_stats (
  period_type ascii,
  date ascii,
  location_id ascii,
  device_id ascii,
  anonymous_users int,
  average_session_per_user int,
  average_session_per_device int,  
  applications int,
  orders int,
  relocation double,
  PRIMARY KEY (location_id, period_type, date, device_id)
);


DROP TABLE location_stats;
CREATE TABLE location_stats (
  period_type ascii,
  date ascii,
  location_id ascii,
  users int,
  average_session_per_user int,
  average_session_per_device int,  
  applications int,
  orders int,
  relocation double,
  device_count int,
  PRIMARY KEY (location_id, period_type, date)
);


DROP TABLE overall_stats;
CREATE TABLE overall_stats (
  period_type ascii,
  date ascii,
  users int,
  average_session_per_user int,
  average_session_per_device int,  
  applications int,
  orders int,
  relocation double,
  device_count int,
  PRIMARY KEY (period_type, date)  
);

DROP TABLE app_stats;
CREATE TABLE app_stats (
  location_id ascii,
  app_id ascii,
  date ascii,
  period_type ascii,
  app_name ascii,
  app_crashes int,
  PRIMARY KEY (location_id, period_type, date, app_id)
);


/* App usage column families */
DROP TABLE device_app_usage;
CREATE TABLE device_app_usage (
  location_id ascii,
  app_id ascii,
  device_id ascii,
  date ascii,
  period_type ascii,
  timespent_in_period map<int, bigint>,
  total_time bigint,
  PRIMARY KEY (location_id, period_type, date, device_id, app_id)
);
