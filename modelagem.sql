CREATE TABLE tutor (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    pais TEXT,
    foto_de_perfil BIT
);

CREATE TABLE grupo (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    media_de_felicidade DECIMAL
);

CREATE TABLE tarefas (
    id SERIAL PRIMARY KEY,
    titulo TEXT,
    data_de_inicio DATE,
    prazo_final DATE
);

CREATE TABLE estudante (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    foto_de_perfil INTEGER,
    pais TEXT,
    indice_de_felicidade INTEGER,
    perfil_de_lideranca TEXT
);

CREATE TABLE estudante_grupo (
    id SERIAL PRIMARY KEY,
    id_estudante INTEGER REFERENCES estudante(id),
    id_grupo INTEGER REFERENCES grupo(id)
);

CREATE TABLE tutor_grupo (
    id SERIAL PRIMARY KEY,
    id_tutor INTEGER REFERENCES tutor(id),
    id_grupo INTEGER REFERENCES grupo(id)
);

CREATE TABLE estudante_tarefa (
    id SERIAL PRIMARY KEY,
    id_tarefas INTEGER REFERENCES tarefas(id),
    id_estudante INTEGER REFERENCES estudante(id)
);

