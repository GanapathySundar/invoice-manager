create table client
(
    id        INTEGER not null
        constraint client_pk
            primary key autoincrement,
    client_id TEXT    not null,
    name      TEXT    not null,
    address   TEXT,
    is_active INTEGER default 1 not null
);

create unique index client_client_id_uindex
    on client (client_id);





CREATE TABLE consultant(
    id int not null primary key autoincrement ,
    first_name text not null ,
    last_name text not null,
    pan_number text not null,
    gst_number text null,
    address text not null,
    is_active int not null default 1
);

create table invoice_log
(
    id            integer not null
        constraint invoice_log_pk
            primary key autoincrement,
    invoice_no    text    not null,
    invoice_date  integer not null,
    client_id     integer not null
        constraint invoice_log___fk_client
            references client(id),
    consultant_id integer not null
        constraint invoice_log___fk_consultant
            references consultant(id),
    created_date  integer not null,
    updated_date  integer
);

create unique index invoice_log_invoice_no_uindex
    on invoice_log (invoice_no);

create index ix_invoice_log
    on invoice_log (client_id, invoice_date);


create table invoice_log_particulars
(
    invoice_id  integer not null
        constraint invoice_log_particulars_invoice_log_id_fk
            references invoice_log,
    item_id     int     not null,
    description text    not null,
    unit_rate   real    not null,
    qty         real default 1.0 not null,
    constraint invoice_log_particulars_pk
        primary key (invoice_id, item_id)
);


