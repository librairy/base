create keyspace if not exists research with replication = {'class' : 'SimpleStrategy', 'replication_factor' : 1};


create table if not exists research.CAMEL_IDEMPOTENT (NAME varchar, KEY varchar, primary key (NAME, KEY)) WITH compaction = {'class':'LeveledCompactionStrategy'} AND gc_grace_seconds = 86400;
create index on research.CAMEL_IDEMPOTENT (NAME);
create index on research.CAMEL_IDEMPOTENT (KEY);

create table if not exists research.sources(uri text, creationTime text, name text, description text, protocol text, url text, domain text, primary key (uri));
create index on research.sources (creationTime);
create index on research.sources (name);
create index on research.sources (protocol);
create index on research.sources (url);
create index on research.sources (domain);

create table if not exists research.contains(bigint id, uri text, creationTime text, startUri text, endUri text, weight double, primary key (uri));
create index on research.contains (startUri);
create index on research.contains (endUri);

create table if not exists research.aggregates(bigint id, uri text, creationTime text, startUri text, endUri text, weight double, primary key (uri));
create index on research.aggregates (startUri);
create index on research.aggregates (endUri);

create table if not exists research.provides(bigint id, uri text, creationTime text, startUri text, endUri text, weight double, primary key (uri));
create index on research.provides (startUri);
create index on research.provides (endUri);

create table if not exists research.composes(bigint id, uri text, creationTime text, startUri text, endUri text, weight double, primary key (uri));
create index on research.composes (startUri);
create index on research.composes (endUri);

create table if not exists research.bundles(bigint id, uri text, creationTime text, startUri text, endUri text, weight double, primary key (uri));
create index on research.bundles (startUri);
create index on research.bundles (endUri);

create table if not exists research.similarTo(bigint id, uri text, creationTime text, domain text, startUri text, endUri text, weight double, primary key (uri));
create index on research.similarTo (startUri);
create index on research.similarTo (endUri);
create index on research.similarTo (domain);

create table if not exists research.dealsWith(bigint id, uri text, creationTime text, startUri text, endUri text, weight double, primary key (uri));
create index on research.dealsWith (startUri);
create index on research.dealsWith (endUri);

create table if not exists research.emergesIn(bigint id, uri text, creationTime text, analysis text, startUri text, endUri text, weight double, primary key (uri));
create index on research.emergesIn (startUri);
create index on research.emergesIn (endUri);
create index on research.emergesIn (analysis);

create table if not exists research.embeddedIn(bigint id, uri text, creationTime text, vector list<double>, startUri text, endUri text, weight double, primary key (uri));
create index on research.embeddedIn (startUri);
create index on research.embeddedIn (endUri);

create table if not exists research.mentions(bigint id, uri text, creationTime text, times bigint, startUri text, endUri text, weight double, primary key (uri));
create index on research.mentions (startUri);
create index on research.mentions (endUri);

create table if not exists research.describes(bigint id, uri text, creationTime text, startUri text, endUri text, weight double, primary key (uri));
create index on research.describes (startUri);
create index on research.describes (endUri);

create table if not exists research.pairsWith(bigint id, uri text, creationTime text, domain text, startUri text, endUri text, weight double, primary key (uri));
create index on research.pairsWith (startUri);
create index on research.pairsWith (endUri);
create index on research.pairsWith (domain);

create table if not exists research.hypernymOf(bigint id, uri text, creationTime text, domain text, provenances map<text,double>, startUri text, endUri text, weight double, primary key (uri));
create index on research.hypernymOf (startUri);
create index on research.hypernymOf (endUri);
create index on research.hypernymOf (domain);

create table if not exists research.appearedIn(bigint id, uri text, creationTime text, times bigint, subtermOf bigint, supertermOf bigint, cvalue double, consensus double, pertinence double, probability double, termhood double, startUri text, endUri text, weight double, primary key (uri));
create index on research.appearedIn (startUri);
create index on research.appearedIn (endUri);

create table if not exists research.serializations(bigint id, uri text, creationTime text, instance blob, primary key (uri));
create index on research.serializations (creationTime);

create table if not exists research.domains(uri text, creationTime text, name text, description text, primary key (uri));
create index on research.domains (creationTime);
create index on research.domains (name);

create table if not exists research.documents(uri text, creationTime text, publishedOn text, publishedBy text, authoredOn text, authoredBy text, contributedBy text, retrievedBy text, retrievedFrom text, retrievedOn text, format text, language text, title text, subject text, description text, rights text, type text, content text, tokens text, primary key (uri));
create index on research.documents (creationTime);
create index on research.documents (publishedOn);
create index on research.documents (publishedBy);
create index on research.documents (authoredOn);
create index on research.documents (authoredBy);
create index on research.documents (contributedBy);
create index on research.documents (retrievedBy);
create index on research.documents (retrievedFrom);
create index on research.documents (retrievedOn);
create index on research.documents (format);
create index on research.documents (language);
create index on research.documents (title);
create index on research.documents (subject);
create index on research.documents (rights);
create index on research.documents (type);

create table if not exists research.items(uri text, creationTime text, authoredOn text, authoredBy text, contributedBy text, format text, language text, title text, subject text, description text, url text, type text, content text, tokens text, annotated text, primary key (uri));
create index on research.items (creationTime);
create index on research.items (authoredOn);
create index on research.items (authoredBy);
create index on research.items (contributedBy);
create index on research.items (format);
create index on research.items (language);
create index on research.items (title);
create index on research.items (subject);
create index on research.items (url);
create index on research.items (type);

create table if not exists research.parts(uri text, creationTime text, sense text, content text, tokens text, primary key (uri));
create index on research.parts (creationTime);
create index on research.parts (sense);

create table if not exists research.terms(uri text, creationTime text, content text, primary key (uri));
create index on research.terms (creationTime);
create index on research.terms (content);

create table if not exists research.words(uri text, creationTime text, content text, primary key (uri));
create index on research.words (creationTime);
create index on research.words (content);

create table if not exists research.topics(uri text, creationTime text, content text, analysis text, primary key (uri));
create index on research.topics (creationTime);
create index on research.topics (analysis);

create table if not exists research.analyses(uri text, creationTime text, type text, description text, configuration text, domain text, primary key (uri));
create index on research.analyses (creationTime);
create index on research.analyses (type);
create index on research.analyses (configuration);
create index on research.analyses (domain);

create table if not exists research.filters(uri text, creationTime text, content text, primary key (uri));
create index on research.filters (creationTime);
create index on research.filters (content);

create table if not exists research.paths(uri text, creationTime text, start text, end text, primary key (uri));
create index on research.paths (creationTime);
create index on research.paths (start);
create index on research.paths (end);
