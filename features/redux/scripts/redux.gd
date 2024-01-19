extends Node

var redux = func(_store: Dictionary) -> Dictionary:
	var store: Dictionary = _store
	var state: Dictionary
	
	# Definições de funções.
	var register: Callable = func(name: String, instance: Callable):
		store \
			.get("register").call(name, instance) \
			.get("with_properties").call([
				{
					"listeners": [],
				}
			])
		
	var unregister: Callable = func(name: String) -> bool:
		return store.get("unregister").call(name)
	
	var dispatch = func(actions: Array[Dictionary]):
		print(actions)
		
		pass
	
	var get_store_list = func() -> Array[Dictionary]:
		return store.get("get_storage_list").call()
	
	return {
		"register": register,
		"unregister": unregister,
		"dispatch": dispatch,
		"get_store_list": get_store_list,
	}
	
func get_instance(_store: Dictionary = {}):
	return redux.call(_store)
