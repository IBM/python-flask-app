from swagger_ui import flask_api_doc
from server import app


flask_api_doc(app, config_path='public/swagger.yaml', url_prefix='/swagger/api-docs', title='API doc')
