package sample.meta;


import sample.meta.TodoMeta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2015-09-02 11:58:35")
/** */
public final class TodoMeta extends org.slim3.datastore.ModelMeta<sample.model.Todo> {

  /** */
  public final org.slim3.datastore.StringAttributeMeta<sample.model.Todo> content = new org.slim3.datastore.StringAttributeMeta<sample.model.Todo>(this, "content", "content");

  /** */
  public final org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, java.lang.Long> id = new org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, java.lang.Long>(this, "id", "id", long.class);

  /** */
  public final org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, java.lang.Integer> itemCount = new org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, java.lang.Integer>(this, "itemCount", "itemCount", int.class);

  /** */
  public final org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

  /** */
  public final org.slim3.datastore.StringAttributeMeta<sample.model.Todo> type = new org.slim3.datastore.StringAttributeMeta<sample.model.Todo>(this, "type", "type");

  /** */
  public final org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<sample.model.Todo, java.lang.Long>(this, "version", "version", java.lang.Long.class);

  private static final TodoMeta slim3_singleton = new TodoMeta();

  /**
   * @return the singleton
   */
  public static TodoMeta get() {
     return slim3_singleton;
  }

  /** */
  public TodoMeta() {
      super("Todo", sample.model.Todo.class);
  }

  @Override
  public sample.model.Todo entityToModel(com.google.appengine.api.datastore.Entity entity) {
      sample.model.Todo model = new sample.model.Todo();
      model.setContent((java.lang.String) entity.getProperty("content"));
      model.setId(longToPrimitiveLong((java.lang.Long) entity.getProperty("id")));
      model.setItemCount(longToPrimitiveInt((java.lang.Long) entity.getProperty("itemCount")));
      model.setKey(entity.getKey());
      model.setType((java.lang.String) entity.getProperty("type"));
      model.setVersion((java.lang.Long) entity.getProperty("version"));
      return model;
  }

  @Override
  public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
      sample.model.Todo m = (sample.model.Todo) model;
      com.google.appengine.api.datastore.Entity entity = null;
      if (m.getKey() != null) {
          entity = new com.google.appengine.api.datastore.Entity(m.getKey());
      } else {
          entity = new com.google.appengine.api.datastore.Entity(kind);
      }
      entity.setProperty("content", m.getContent());
      entity.setProperty("id", m.getId());
      entity.setProperty("itemCount", m.getItemCount());
      entity.setProperty("type", m.getType());
      entity.setProperty("version", m.getVersion());
      entity.setProperty("slim3.schemaVersion", 1);
      return entity;
  }

  @Override
  protected com.google.appengine.api.datastore.Key getKey(Object model) {
      sample.model.Todo m = (sample.model.Todo) model;
      return m.getKey();
  }

  @Override
  protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
      validateKey(key);
      sample.model.Todo m = (sample.model.Todo) model;
      m.setKey(key);
  }

  @Override
  protected long getVersion(Object model) {
      sample.model.Todo m = (sample.model.Todo) model;
      return m.getVersion() != null ? m.getVersion().longValue() : 0L;
  }

  @Override
  protected void assignKeyToModelRefIfNecessary(com.google.appengine.api.datastore.AsyncDatastoreService ds, java.lang.Object model) {
  }

  @Override
  protected void incrementVersion(Object model) {
      sample.model.Todo m = (sample.model.Todo) model;
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
      sample.model.Todo m = (sample.model.Todo) model;
      writer.beginObject();
      org.slim3.datastore.json.Default encoder0 = new org.slim3.datastore.json.Default();
      if(m.getContent() != null){
          writer.setNextPropertyName("content");
          encoder0.encode(writer, m.getContent());
      }
      writer.setNextPropertyName("id");
      encoder0.encode(writer, m.getId());
      writer.setNextPropertyName("itemCount");
      encoder0.encode(writer, m.getItemCount());
      if(m.getKey() != null){
          writer.setNextPropertyName("key");
          encoder0.encode(writer, m.getKey());
      }
      if(m.getType() != null){
          writer.setNextPropertyName("type");
          encoder0.encode(writer, m.getType());
      }
      if(m.getVersion() != null){
          writer.setNextPropertyName("version");
          encoder0.encode(writer, m.getVersion());
      }
      writer.endObject();
  }

  @Override
  protected sample.model.Todo jsonToModel(org.slim3.datastore.json.JsonRootReader rootReader, int maxDepth, int currentDepth) {
      sample.model.Todo m = new sample.model.Todo();
      org.slim3.datastore.json.JsonReader reader = null;
      org.slim3.datastore.json.Default decoder0 = new org.slim3.datastore.json.Default();
      reader = rootReader.newObjectReader("content");
      m.setContent(decoder0.decode(reader, m.getContent()));
      reader = rootReader.newObjectReader("id");
      m.setId(decoder0.decode(reader, m.getId()));
      reader = rootReader.newObjectReader("itemCount");
      m.setItemCount(decoder0.decode(reader, m.getItemCount()));
      reader = rootReader.newObjectReader("key");
      m.setKey(decoder0.decode(reader, m.getKey()));
      reader = rootReader.newObjectReader("type");
      m.setType(decoder0.decode(reader, m.getType()));
      reader = rootReader.newObjectReader("version");
      m.setVersion(decoder0.decode(reader, m.getVersion()));
      return m;
  }
}
