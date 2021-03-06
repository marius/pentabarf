
CREATE OR REPLACE VIEW view_event_attachment AS
  SELECT event_attachment_id,
         attachment_type,
         attachment_type_localized.name AS attachment_type_name,
         event_id,
         conference_id,
         mime_type,
         mime_type_localized.name AS mime_type_name,
         filename,
         title,
         pages,
         public,
         octet_length( data ) AS filesize,
         attachment_type_localized.translated
    FROM event_attachment
         INNER JOIN (
             SELECT event_id,
                    conference_id
               FROM event
         ) AS event USING (event_id)
         INNER JOIN attachment_type_localized USING (attachment_type)
         INNER JOIN mime_type_localized USING (mime_type, translated)
;

