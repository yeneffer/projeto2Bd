CREATE SEQUENCE seq_evento;
CREATE SEQUENCE seq_atividade;
CREATE SEQUENCE seq_palestrante;
CREATE SEQUENCE seq_participante;
CREATE SEQUENCE seq_inscricao_evento;
CREATE SEQUENCE seq_inscricao_atividade;
CREATE SEQUENCE seq_patrocinador;
CREATE SEQUENCE seq_evento_patrocinador;
CREATE SEQUENCE seq_atividade_palestrante;
CREATE SEQUENCE seq_voluntario;
CREATE SEQUENCE seq_voluntario_atividade;
CREATE SEQUENCE seq_voluntario_evento;

-- Tabela Evento
CREATE TABLE Evento (
  CP_id_evento INTEGER PRIMARY KEY DEFAULT nextval('seq_evento'),
  nome_evento VARCHAR(255) NOT NULL,
  dt_inicio DATE NOT NULL,
  dt_fim DATE NOT NULL,
  local_evento VARCHAR(19) NOT NULL
);

-- Tabela Atividade
CREATE TABLE Atividade (
  CP_id_atv INTEGER PRIMARY KEY DEFAULT nextval('seq_atividade'),
  nome_atv VARCHAR(255) NOT NULL,
  tipo_atv VARCHAR(9) NOT NULL,
  dt_atv TIMESTAMP NOT NULL,
  cpci_max INT NOT NULL,
  ce_id_evento INTEGER,
  CONSTRAINT fk_evento
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento)
);

-- Tabela Palestrante
CREATE TABLE Palestrante (
  CP_id_palestrante INTEGER PRIMARY KEY DEFAULT nextval('seq_palestrante'),
  nome_palest VARCHAR(100) NOT NULL,
  mini_bio_palest VARCHAR(255),
  contato_palest VARCHAR(50) NOT NULL
);

-- Tabela Participante
CREATE TABLE Participante (
  CP_id_participante INTEGER PRIMARY KEY DEFAULT nextval('seq_participante'),
  nome_particip VARCHAR(100) NOT NULL,
  contato_particip VARCHAR(50) NOT NULL
);

-- Tabela Inscricao_evento
CREATE TABLE Inscricao_evento (
  CP_id_inscricao_evnt INTEGER PRIMARY KEY DEFAULT nextval('seq_inscricao_evento'),
  stts_inscricao_evnt VARCHAR(9) NOT NULL,
  tipo_inscricao VARCHAR(12) NOT NULL,
  tipo_participacao VARCHAR(12) NOT NULL,
  ce_id_participante INTEGER,
  ce_id_evento INTEGER,
  CONSTRAINT fk_participante
    FOREIGN KEY (ce_id_participante) 
    REFERENCES Participante(CP_id_participante),
  CONSTRAINT fk_evento_inscricao
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento)
);

-- Tabela Inscricao_atividade
CREATE TABLE Inscricao_atividade (
  CP_id_inscricao_atv INTEGER PRIMARY KEY DEFAULT nextval('seq_inscricao_atividade'),
  stts_inscricao_atv VARCHAR(9) NOT NULL,
  ce_id_evento INTEGER,
  ce_id_participante INTEGER,
  ce_id_atividade INTEGER,
  CONSTRAINT fk_evento_atividade
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento),
  CONSTRAINT fk_participante_atividade
    FOREIGN KEY (ce_id_participante) 
    REFERENCES Participante(CP_id_participante),
  CONSTRAINT fk_atividade
    FOREIGN KEY (ce_id_atividade) 
    REFERENCES Atividade(CP_id_atv)
);

-- Tabela Patrocinador
CREATE TABLE Patrocinador (
  CP_id_patrocinador INTEGER PRIMARY KEY DEFAULT nextval('seq_patrocinador'),
  nome_ptr VARCHAR(100) NOT NULL,
  contato_ptr VARCHAR(50) NOT NULL
);

-- Tabela Evento_patrocinador
CREATE TABLE Evento_patrocinador (
  ce_id_evento INTEGER,
  ce_id_patrocinador INTEGER,
  PRIMARY KEY (ce_id_evento, ce_id_patrocinador),
  CONSTRAINT fk_evento_patrocinador
    FOREIGN KEY (ce_id_evento) 
    REFERENCES Evento(CP_id_evento),
  CONSTRAINT fk_patrocinador
    FOREIGN KEY (ce_id_patrocinador) 
    REFERENCES Patrocinador(CP_id_patrocinador)
);

-- Tabela Atividade_Palestrante
CREATE TABLE Atividade_Palestrante (
  ce_id_atividade INTEGER,
  ce_id_palestrante INTEGER,
  PRIMARY KEY (ce_id_atividade, ce_id_palestrante),
  CONSTRAINT fk_atividade_palestrante
    FOREIGN KEY (ce_id_atividade) 
    REFERENCES Atividade(CP_id_atv),
  CONSTRAINT fk_palestrante
    FOREIGN KEY (ce_id_palestrante) 
    REFERENCES Palestrante(CP_id_palestrante)
);

-- Criar a tabela Voluntario
CREATE TABLE Voluntario (
  cp_id_voluntario INTEGER PRIMARY KEY DEFAULT nextval('seq_voluntario'),
  nome_voluntario VARCHAR(100) NOT NULL,
  contato_voluntario VARCHAR(50) NOT NULL
);


-- Tabela de associação de voluntários a eventos
CREATE TABLE Voluntario_Evento (
  ce_id_evento INT REFERENCES Evento(CP_id_evento),
  ce_id_voluntario INT REFERENCES Voluntario(cp_id_voluntario),
  PRIMARY KEY (ce_id_evento, ce_id_voluntario)
);

-- Tabela de associação de voluntários a atividades
CREATE TABLE Voluntario_Atividade (
  ce_id_atividade INT REFERENCES Atividade(CP_id_atv),
  ce_id_voluntario INT REFERENCES Voluntario(cp_id_voluntario),
  PRIMARY KEY (ce_id_atividade, ce_id_voluntario)
);
