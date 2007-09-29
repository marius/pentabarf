
CREATE TABLE team (
  team_id SERIAL NOT NULL,
  tag TEXT NOT NULL,
  conference_id INTEGER NOT NULL,
  rank INTEGER,
  FOREIGN KEY (conference_id) REFERENCES conference(conference_id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (team_id)
);

