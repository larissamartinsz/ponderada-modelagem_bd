CREATE TABLE tarefas (
    id SERIAL PRIMARY KEY,
    titulo TEXT,
    data_de_inicio DATE,
    prazo_final DATE
);

CREATE TABLE tutor (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    pais TEXT,
    foto_de_perfil BYTEA
);

CREATE TABLE grupo (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    media_de_felicidade DECIMAL,
    id_tutor INTEGER REFERENCES tutor(id)
);

CREATE TABLE perfil_comportamental (
    id SERIAL PRIMARY KEY,
    id_respostas INTEGER REFERENCES respostas(id),
    desc_perfil TEXT
);

CREATE TABLE respostas (
    id SERIAL PRIMARY KEY,
    id_alternativa INTEGER REFERENCES alternativa(id),
    id_pergunta INTEGER REFERENCES pergunta(id)
);

CREATE TABLE pergunta (
    id SERIAL PRIMARY KEY,
    texto TEXT,
    id_questionario INTEGER REFERENCES questionario(id)
);

CREATE TABLE questionario (
    id SERIAL PRIMARY KEY,
    tipo_de_questionario INTEGER,
    id_tarefas INTEGER REFERENCES tarefas(id)
);

CREATE TABLE alternativa (
    id SERIAL PRIMARY KEY,
    texto TEXT,
    id_pergunta INTEGER REFERENCES pergunta(id)
);

CREATE TABLE estudante (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    foto_de_perfil BYTEA,
    pais TEXT,
    indice_de_felicidade INTEGER,
    id_grupo INTEGER REFERENCES grupo(id),
    id_perfil_comportamental INTEGER REFERENCES perfil_comportamental(id)
);

CREATE TABLE estudante_tarefa (
    id SERIAL PRIMARY KEY,
    id_tarefas INTEGER REFERENCES tarefas(id),
    id_estudante INTEGER REFERENCES estudante(id)
);
