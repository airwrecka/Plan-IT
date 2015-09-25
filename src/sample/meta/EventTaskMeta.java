package sample.meta;

import sample.meta.EventTaskMeta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2015-09-14 14:38:26")
/** */
public final class EventTaskMeta extends org.slim3.datastore.ModelMeta<sample.model.EventTask> {

    /** */
    public final org.slim3.datastore.StringAttributeMeta<sample.model.EventTask> eventName = new org.slim3.datastore.StringAttributeMeta<sample.model.EventTask>(this, "eventName", "eventName");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, java.lang.Long> id = new org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, java.lang.Long>(this, "id", "id", long.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, java.lang.Integer> status = new org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, java.lang.Integer>(this, "status", "status", int.class);

    /** */
    public final org.slim3.datastore.StringAttributeMeta<sample.model.EventTask> todoID = new org.slim3.datastore.StringAttributeMeta<sample.model.EventTask>(this, "todoID", "todoID");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<sample.model.EventTask, java.lang.Long>(this, "version", "version", java.lang.Long.class);

    private static final EventTaskMeta slim3_singleton = new EventTaskMeta();

    /**
     * @return the singleton
     */
    public static EventTaskMeta get() {
       return slim3_singleton;
    }

    /** */
    public EventTaskMeta() {
        super("EventTask", sample.model.EventTask.class);
    }

    @Override
    public sample.model.EventTask entityToModel(com.google.appengine.api.datastore.Entity entity) {
        sample.model.EventTask model = new sample.model.EventTask();
        model.setEventName((java.lang.String) entity.getProperty("eventName"));
        model.setId(longToPrimitiveLong((java.lang.Long) entity.getProperty("id")));
        model.setKey(entity.getKey());
        model.setStatus(longToPrimitiveInt((java.lang.Long) entity.getProperty("status")));
        model.setTodoID((java.lang.String) entity.getProperty("todoID"));
        model.setVersion((java.lang.Long) entity.getProperty("version"));
        return model;
    }

    @Override
    public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
        sample.model.EventTask m = (sample.model.EventTask) model;
        com.google.appengine.api.datastore.Entity entity = null;
        if (m.getKey() != null) {
            entity = new com.google.appengine.api.datastore.Entity(m.getKey());
        } else {
            entity = new com.google.appengine.api.datastore.Entity(kind);
        }
        entity.setProperty("eventName", m.getEventName());
        entity.setProperty("id", m.getId());
        entity.setProperty("status", m.getStatus());
        entity.setProperty("todoID", m.getTodoID());
        entity.setProperty("version", m.getVersion());
        entity.setProperty("slim3.schemaVersion", 1);
        return entity;
    }

    @Override
    protected com.google.appengine.api.datastore.Key getKey(Object model) {
        sample.model.EventTask m = (sample.model.EventTask) model;
        return m.getKey();
    }

    @Override
    protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
        validateKey(key);
        sample.model.EventTask m = (sample.model.EventTask) model;
        m.setKey(key);
    }

    @Override
    protected long getVersion(Object model) {
        sample.model.EventTask m = (sample.model.EventTask) model;
        return m.getVersion() != null ? m.getVersion().longValue() : 0L;
    }

    @Override
    protected void assignKeyToModelRefIfNecessary(com.google.appengine.api.datastore.AsyncDatastoreService ds, java.lang.Object model) {
    }

    @Override
    protected void incrementVersion(Object model) {
        sample.model.EventTask m = (sample.model.EventTask) model;
        long version = m.getVersion() != null ? m.getVersion().longValue() : 0L;
        m.setVersion(Long.valueOf(version + 1L));
    }

    @Override
    protected void prePut(Object model) {
    }

    @Override
    protected void postGet(Object model) {
    }

    @Override
    public String getSchemaVersionName() {
        return "slim3.schemaVersion";
    }

    @Override
    public String getClassHierarchyListName() {
        return "slim3.classHierarchyList";
    }

    @Override
    protected boolean isCipherProperty(String propertyName) {
        return false;
    }

    @Override
    protected void modelToJson(org.slim3.datastore.json.JsonWriter writer, java.lang.Object model, int maxDepth, int currentDepth) {
        sample.model.EventTask m = (sample.model.EventTask) model;
        writer.beginObject();
        org.slim3.datastore.json.Default encoder0 = new org.slim3.datastore.json.Default();
        if(m.getEventName() != null){
            writer.setNextPropertyName("eventName");
            encoder0.encode(writer, m.getEventName());
        }
        writer.setNextPropertyName("id");
        encoder0.encode(writer, m.getId());
        if(m.getKey() != null){
            writer.setNextPropertyName("key");
            encoder0.encode(writer, m.getKey());
        }
        writer.setNextPropertyName("status");
        encoder0.encode(writer, m.getStatus());
        writer.setNextPropertyName("todoID");
        if(m.getVersion() != null){
            writer.setNextPropertyName("version");
            encoder0.encode(writer, m.getVersion());
        }
        writer.endObject();
    }

    @Override
    protected sample.model.EventTask jsonToModel(org.slim3.datastore.json.JsonRootReader rootReader, int maxDepth, int currentDepth) {
        sample.model.EventTask m = new sample.model.EventTask();
        org.slim3.datastore.json.JsonReader reader = null;
        org.slim3.datastore.json.Default decoder0 = new org.slim3.datastore.json.Default();
        reader = rootReader.newObjectReader("eventName");
        m.setEventName(decoder0.decode(reader, m.getEventName()));
        reader = rootReader.newObjectReader("id");
        m.setId(decoder0.decode(reader, m.getId()));
        reader = rootReader.newObjectReader("key");
        m.setKey(decoder0.decode(reader, m.getKey()));
        reader = rootReader.newObjectReader("status");
        m.setStatus(decoder0.decode(reader, m.getStatus()));
        reader = rootReader.newObjectReader("todoID");
        m.setTodoID(decoder0.decode(reader, m.getTodoID()));
        reader = rootReader.newObjectReader("version");
        m.setVersion(decoder0.decode(reader, m.getVersion()));
        return m;
    }
}