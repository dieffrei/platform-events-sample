public interface Repository {
	SObject findById(Id id);
	List<SObject> findById(Set<Id> ids);
}