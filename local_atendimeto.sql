-- View: rl_esus."LOCAL_ATENDIMENTO"

DROP VIEW if exists rl_esus."LOCAL_ATENDIMENTO";

CREATE OR REPLACE VIEW rl_esus."LOCAL_ATENDIMENTO" AS 
 SELECT m.no_municipio,
    u.no_unidade_saude,
    u.nu_cnes,
    p.nu_cns,
    p.no_profissional,
    c.no_cbo,
    c.nu_cbo,
    t.nu_ano,
    l.ds_local_atendimento,
    count(
        CASE
            WHEN t.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS jan,
    count(
        CASE
            WHEN t.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS fev,
    count(
        CASE
            WHEN t.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS mar,
    count(
        CASE
            WHEN t.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS abr,
    count(
        CASE
            WHEN t.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS mai,
    count(
        CASE
            WHEN t.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS jun,
    count(
        CASE
            WHEN t.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS jul,
    count(
        CASE
            WHEN t.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS ago,
    count(
        CASE
            WHEN t.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS sete,
    count(
        CASE
            WHEN t.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS outu,
    count(
        CASE
            WHEN t.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS nov,
    count(
        CASE
            WHEN t.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS dez
   FROM tb_fat_atendimento_individual a
     JOIN tb_dim_profissional p ON a.co_dim_profissional_1 = p.co_seq_dim_profissional
     JOIN tb_dim_tempo t ON a.co_dim_tempo = t.co_seq_dim_tempo
     JOIN tb_dim_local_atendimento l ON a.co_dim_local_atendimento = l.co_seq_dim_local_atendimento
     JOIN tb_dim_cbo c ON a.co_dim_cbo_1 = c.co_seq_dim_cbo
     JOIN tb_dim_unidade_saude u ON a.co_dim_unidade_saude_1 = u.co_seq_dim_unidade_saude
     JOIN tb_dim_municipio m ON a.co_dim_municipio = m.co_seq_dim_municipio
  GROUP BY m.no_municipio, u.no_unidade_saude, u.nu_cnes, p.nu_cns, p.no_profissional, c.no_cbo, c.nu_cbo, t.nu_ano, l.ds_local_atendimento;

ALTER TABLE rl_esus."LOCAL_ATENDIMENTO"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."LOCAL_ATENDIMENTO" TO postgres;
GRANT ALL ON TABLE rl_esus."LOCAL_ATENDIMENTO" TO pmaq;
GRANT ALL ON TABLE rl_esus."LOCAL_ATENDIMENTO" TO relatorio;
