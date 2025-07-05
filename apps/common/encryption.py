from cryptography.fernet import Fernet
from django.conf import settings
import base64
import hashlib

class AESCipher:
    def __init__(self):
        key = hashlib.sha256(settings.AES_KEY).digest()
        self.cipher = Fernet(base64.urlsafe_b64encode(key))
    
    def encrypt(self, data):
        """Encrypt string data"""
        return self.cipher.encrypt(data.encode()).decode()
    
    def decrypt(self, encrypted_data):
        return self.cipher.decrypt(encrypted_data.encode()).decode()

aes_cipher = AESCipher()