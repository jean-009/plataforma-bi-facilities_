-- *********************************************************
-- 1. CRIAÇÃO DA TABELA MESTRA DE FUNCIONÁRIOS (dim_funcionario) - CORRIGIDA
-- PK gerada automaticamente pelo SERIAL
-- *********************************************************
CREATE TABLE IF NOT EXISTS dim_funcionario (
    funcionario_id SERIAL PRIMARY KEY,              
    nome_completo VARCHAR(255) NOT NULL,            
    cpf VARCHAR(14) UNIQUE,                         
    data_admissao DATE,
    cargo VARCHAR(100),
    data_demissao DATE,
    status_atual VARCHAR(50)                        
);

-- *********************************************************
-- 2. CRIAÇÃO DA TABELA MESTRA DE PROJETOS/CONTRATOS (dim_projeto)
-- *********************************************************
CREATE TABLE IF NOT EXISTS dim_projeto (
    projeto_id SERIAL PRIMARY KEY,                  
    cliente_id INT,                                
    nome_projeto VARCHAR(255) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    valor_contrato NUMERIC(15, 2),                  
    status_contrato VARCHAR(50)                     
);

-- *********************************************************
-- 3. CRIAÇÃO DA TABELA DE ESCALA (ft_rh_escala)
-- *********************************************************
CREATE TABLE IF NOT EXISTS ft_rh_escala (
    escala_id BIGSERIAL PRIMARY KEY,                
    funcionario_fk INT REFERENCES dim_funcionario(funcionario_id), 
    projeto_fk INT REFERENCES dim_projeto(projeto_id),             
    data_escala DATE NOT NULL,
    hora_inicio TIME,
    hora_fim TIME,
    horas_trabalhadas NUMERIC(4, 2)                 
);

-- *********************************************************
-- 4. CRIAÇÃO DA TABELA DE CUSTOS (ft_financeiro_custos)
-- *********************************************************
CREATE TABLE IF NOT EXISTS ft_financeiro_custos (
    custo_id BIGSERIAL PRIMARY KEY,
    funcionario_fk INT REFERENCES dim_funcionario(funcionario_id), 
    data_movimentacao DATE NOT NULL,
    tipo_custo VARCHAR(50) NOT NULL,                
    valor NUMERIC(10, 2) NOT NULL
);