CONNECTION = SQLite3::Database.new("assignment-API.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS assignments (id INTEGER PRIMARY KEY, name TEXT, description TEXT, github TEXT, partner_id INTEGER);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS links (id INTEGER PRIMARY KEY, assignment_id INTEGER, article_or_video TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS partners (id INTEGER PRIMARY KEY, partner TEXT);")

CONNECTION.results_as_hash = true