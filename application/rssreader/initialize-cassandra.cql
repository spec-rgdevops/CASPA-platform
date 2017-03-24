CREATE KEYSPACE "RSS" WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE "RSS";
CREATE COLUMNFAMILY "Subscriptions" ( key text, column1 text, value text, PRIMARY KEY (key, column1)) WITH COMPACT STORAGE;
