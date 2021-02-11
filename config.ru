require "./config/environment"

# mount controllers so that they can inherit Application Controller to use
use StudentsController
use LeadsController
use SpotsController
run ApplicationController
