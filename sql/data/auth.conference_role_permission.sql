
SET client_encoding = 'UTF8';
SET search_path = auth, pg_catalog;

INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'account::modify_own');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'account_conference_role::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'account_conference_role::delete');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'conference::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'conference::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'conference_person::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'conference_person::delete');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'conference_person::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'event::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'event::delete');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'event::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'event::modify_own');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'event::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'pentabarf::login');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'person::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'person::delete');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'person::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'person::modify_own');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'person::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'rating::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'rating::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'rating::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'review::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('admin', 'submission::login');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'account::modify_own');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'conference::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'conference::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'conference_person::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'conference_person::delete');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'conference_person::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'event::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'event::delete');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'event::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'event::modify_own');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'event::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'pentabarf::login');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'person::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'person::delete');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'person::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'person::modify_own');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'person::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'rating::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'rating::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'rating::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'review::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('committee', 'submission::login');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'account::modify_own');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'conference::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'event::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'pentabarf::login');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'person::show');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'rating::create');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'rating::modify');
INSERT INTO conference_role_permission (conference_role, permission) VALUES ('reviewer', 'review::modify');