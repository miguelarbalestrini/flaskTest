from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/test-ip', methods=['GET'])
def test_ip():
    # Obtener la dirección IP del cliente
    client_ip = request.remote_addr
    # return jsonify({"status": "ok"}), 200
    return f'La dirección IP del cliente es: {client_ip}'


if __name__ == '__main__':
    app.run(debug=True)
