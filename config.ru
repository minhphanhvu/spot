require "./config/environment"

# mount controllers so that they can inherit Application Controller to use
use UsersController
use SpotsController
run ApplicationController
