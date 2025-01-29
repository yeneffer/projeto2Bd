-- Inserir dados na tabela Evento
INSERT INTO Evento (nome_evento, dt_inicio, dt_fim, local_evento)
SELECT
  'Evento ' || i, 
  DATE_ADD(CURRENT_DATE, INTERVAL (i % 30) DAY) AS dt_inicio, 
  DATE_ADD(CURRENT_DATE, INTERVAL ((i % 30) + 1) DAY) AS dt_fim, 
  CASE WHEN i % 2 = 0 THEN 'Presencial' ELSE 'Online' END
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Atividade
INSERT INTO Atividade (nome_atv, tipo_atv, dt_atv, cpci_max, ce_id_evento)
SELECT
  'Atividade ' || i, 
  CASE WHEN i % 3 = 0 THEN 'palestra' WHEN i % 3 = 1 THEN 'workshop' ELSE 'painel' END,
  DATE_ADD(CURRENT_DATE, INTERVAL (i % 30) DAY) + INTERVAL '2 hour' AS dt_atv,
  100 + (i % 50), 
  i
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Palestrante
INSERT INTO Palestrante (nome_palest, mini_bio_palest, contato_palest)
SELECT
  'Palestrante ' || i, 
  'Mini bio do palestrante ' || i, 
  'palestrante' || i || '@exemplo.com'
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Participante
INSERT INTO Participante (nome_particip, contato_particip)
SELECT
  'Participante ' || i, 
  'participante' || i || '@exemplo.com'
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Inscricao_evento
INSERT INTO Inscricao_evento (stts_inscricao_evnt, tipo_inscricao, tipo_participacao, ce_id_participante, ce_id_evento)
SELECT
  CASE WHEN i % 4 = 0 THEN 'aprovada' WHEN i % 4 = 1 THEN 'recusada' WHEN i % 4 = 2 THEN 'pendente' ELSE 'cancelada' END, 
  CASE WHEN i % 3 = 0 THEN 'estudante' WHEN i % 3 = 1 THEN 'profissional' ELSE 'VIP' END,
  CASE WHEN i % 2 = 0 THEN 'online' ELSE 'presencial' END,
  i, 
  i
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Inscricao_atividade
INSERT INTO Inscricao_atividade (stts_inscricao_atv, ce_id_evento, ce_id_participante, ce_id_atividade)
SELECT
  CASE WHEN i % 4 = 0 THEN 'aprovada' WHEN i % 4 = 1 THEN 'recusada' WHEN i % 4 = 2 THEN 'pendente' ELSE 'cancelada' END, 
  i, 
  i, 
  i
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Patrocinador
INSERT INTO Patrocinador (nome_ptr, contato_ptr)
SELECT
  'Patrocinador ' || i, 
  'patrocinador' || i || '@exemplo.com'
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Evento_patrocinador
INSERT INTO Evento_patrocinador (ce_id_evento, ce_id_patrocinador)
SELECT
  i, 
  i
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Atividade_Palestrante
INSERT INTO Atividade_Palestrante (ce_id_atividade, ce_id_palestrante)
SELECT
  i, 
  i
FROM range(1, 100) AS t(i);

-- Inserir dados na tabela Voluntario
INSERT INTO Voluntario (nome_voluntario, contato_voluntario) 
VALUES 
  ('Voluntario 1', 'voluntario1@exemplo.com'),
  ('Voluntario 2', 'voluntario2@exemplo.com'),
  ('Voluntario 3', 'voluntario3@exemplo.com'),
  ('Voluntario 4', 'voluntario4@exemplo.com'),
  ('Voluntario 5', 'voluntario5@exemplo.com'),
  ('Voluntario 6', 'voluntario6@exemplo.com'),
  ('Voluntario 7', 'voluntario7@exemplo.com'),
  ('Voluntario 8', 'voluntario8@exemplo.com'),
  ('Voluntario 9', 'voluntario9@exemplo.com'),
  ('Voluntario 10', 'voluntario10@exemplo.com');

-- Inserir dados na tabela Voluntario_Evento
INSERT INTO Voluntario_Evento (ce_id_evento, ce_id_voluntario) 
VALUES 
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

-- Inserir dados na tabela Voluntario_Atividade
INSERT INTO Voluntario_Atividade (ce_id_atividade, ce_id_voluntario) 
VALUES 
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);
