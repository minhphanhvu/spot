require "./config/environment"

# mount controllers so that they can inherit Application Controller to use
run ApplicationController
use UsersController
use SpotsController
