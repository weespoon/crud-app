INSERT INTO person (
    person_id,
    first_name,
    last_name,
    email_address,
    street_address,
    city,
    state,
    zip_code,
    client_id
) VALUES (
    1,
    'John',
    'Smith',
    'fake1@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    1
), (
    2,
    'Jane',
    'Smith',
    'fake2@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    1

) , (
    3,
    'Joan',
    'Smiley',
    'fake3@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    2

);

INSERT INTO client (
    client_id,
    company_name,
    website_uri,
    phone_number,
    street_address,
    city,
    state,
    zip_code
) VALUES (
    1,
    'My Widget Inc.',
    'http://mywidget.inc',
    '123-456-7890',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801'
), (
    2,
    'Performance Corp.',
    'http://performance.co',
    '123-456-0987',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801'
);
