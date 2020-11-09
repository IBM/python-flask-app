from server import app
import unittest


class ServerTestCase(unittest.TestCase):

    def setUp(self):
        # create a test client
        self.app = app.test_client()
        self.app.testing = True

    def tearDown(self):
        pass

    def test_root_endpoint(self):
        result = self.app.get('/')
        self.assertEqual(result.status_code, 200)

    def test_health_endpoint(self):
        result = self.app.get('/health')
        self.assertTrue(b'UP' in result.data)


if __name__ == '__main__':
    unittest.main()
