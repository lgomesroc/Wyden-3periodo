from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

# Dados temporários (vão ser removidos posteriormente ao adicionar o banco de dados)
voluntarios = []
alimentos = []

# Rota para a página inicial
@app.route('/')
def home():
    return render_template('index.html')

# Rota sobre a aplicação
@app.route('/about')
def about():
    return render_template('about.html')

# Rota para verificar se o servidor está funcionando
@app.route('/funciona', methods=['GET', 'POST'])
def funciona():
    if request.method == 'POST':
        return jsonify({"message": "Servidor Flask está funcionando!"})
    return jsonify({"message": "Método GET não permitido para esta rota."})

# Rota para adicionar voluntários
@app.route('/add_voluntario', methods=['POST'])
def add_voluntario():
    data = request.get_json()
    voluntarios.append(data)
    return jsonify({"message": "Voluntário adicionado com sucesso!", "voluntarios": voluntarios})

# Rota para adicionar alimentos
@app.route('/add_alimento', methods=['POST'])
def add_alimento():
    data = request.get_json()
    alimentos.append(data)
    return jsonify({"message": "Alimento adicionado com sucesso!", "alimentos": alimentos})

# Rota para exibir voluntários e alimentos
@app.route('/listar', methods=['GET'])
def listar():
    return jsonify({"voluntarios": voluntarios, "alimentos": alimentos})

# Rota para registrar voluntário
@app.route('/register_volunteer', methods=['GET', 'POST'])
def register_volunteer():
    if request.method == 'POST':
        data = request.form.to_dict()
        voluntarios.append(data)
        return jsonify({"message": "Voluntário registrado com sucesso!", "voluntarios": voluntarios})
    return render_template('register_volunteer.html')

# Rota para registrar doação
@app.route('/register_donation', methods=['GET', 'POST'])
def register_donation():
    if request.method == 'POST':
        data = request.form.to_dict()
        alimentos.append(data)
        return jsonify({"message": "Doação registrada com sucesso!", "alimentos": alimentos})
    return render_template('register_donation.html')

# Rota para listar voluntários
@app.route('/volunteers', methods=['GET'])
def volunteers():
    return render_template('volunteers.html', voluntarios=voluntarios)

# Rota para listar doações
@app.route('/donations', methods=['GET'])
def donations():
    return render_template('donations.html', alimentos=alimentos)

if __name__ == '__main__':
    app.run(debug=True)
