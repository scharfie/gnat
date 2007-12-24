# init
require 'ardes/response_for_resources_controller/actions'
require 'ardes/response_for_resources_controller/singleton_actions'

Ardes::ResourcesController.actions = Ardes::ResponseForResourcesController::Actions
Ardes::ResourcesController.singleton_actions = Ardes::ResponseForResourcesController::SingletonActions