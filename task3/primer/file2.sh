#!/bin/bash
cat << "EOF" | openssl dgst -sha256 > DIGEST
       {��&�J�l���N�U��Z�E.�'.�.I$�����x�E��Z�`��
ı�D�w�gi�5hBȁHg����W�$�v0'0���F�����r6~&����ΪdIw��x( �uѹ���P��뗲
EOF
digest=$(cat DIGEST | cut -c10- )
echo "The sha256 digest is $digest"