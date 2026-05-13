let alunos = [];

function cadastrarAluno() {

    let nome = document.getElementById('nome').value;
    let matricula = document.getElementById('matricula').value;
    let curso = document.getElementById('curso').value;

    if(nome === '' || matricula === '' || curso === '') {
        alert('Preencha todos os campos!');
        return;
    }

    let aluno = {
        nome,
        matricula,
        curso
    };

    alunos.push(aluno);

    atualizarTabela();

    limparCampos();
}

function atualizarTabela() {

    let tabela = document.getElementById('tabelaAlunos');

    tabela.innerHTML = '';

    alunos.forEach(aluno => {

        tabela.innerHTML += `
            <tr>
                <td>${aluno.nome}</td>
                <td>${aluno.matricula}</td>
                <td>${aluno.curso}</td>
            </tr>
        `;
    });
}

function limparCampos() {

    document.getElementById('nome').value = '';
    document.getElementById('matricula').value = '';
    document.getElementById('curso').value = '';
}