-- View: rl_esus."TIPO_ATEND_DIARIO_PROFISSIONAL"

DROP VIEW if exists  rl_esus."TIPO_ATEND_DIARIO_PROFISSIONAL";

CREATE OR REPLACE VIEW rl_esus."TIPO_ATEND_DIARIO_PROFISSIONAL" AS 
 SELECT m.no_municipio,
    tb_dim_unidade_saude.no_unidade_saude,
    tb_dim_unidade_saude.nu_cnes,
    p.nu_cns,
    p.no_profissional,
    c.no_cbo,
    c.nu_cbo,
    (to_char(t.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(t.dt_registro::timestamp with time zone, 'MM'::text) AS comp,
    tb_dim_tipo_atendimento.ds_tipo_atendimento,
    count(
        CASE
            WHEN t.nu_dia = 1 THEN 1
            ELSE NULL::integer
        END) AS dia_1,
    count(
        CASE
            WHEN t.nu_dia = 2 THEN 1
            ELSE NULL::integer
        END) AS dia2,
    count(
        CASE
            WHEN t.nu_dia = 3 THEN 1
            ELSE NULL::integer
        END) AS dia_3,
    count(
        CASE
            WHEN t.nu_dia = 4 THEN 1
            ELSE NULL::integer
        END) AS dia_4,
    count(
        CASE
            WHEN t.nu_dia = 5 THEN 1
            ELSE NULL::integer
        END) AS dia5,
    count(
        CASE
            WHEN t.nu_dia = 6 THEN 1
            ELSE NULL::integer
        END) AS dia_6,
    count(
        CASE
            WHEN t.nu_dia = 7 THEN 1
            ELSE NULL::integer
        END) AS dia_7,
    count(
        CASE
            WHEN t.nu_dia = 8 THEN 1
            ELSE NULL::integer
        END) AS dia_8,
    count(
        CASE
            WHEN t.nu_dia = 9 THEN 1
            ELSE NULL::integer
        END) AS dia_9,
    count(
        CASE
            WHEN t.nu_dia = 10 THEN 1
            ELSE NULL::integer
        END) AS dia_10,
    count(
        CASE
            WHEN t.nu_dia = 11 THEN 1
            ELSE NULL::integer
        END) AS dia_11,
    count(
        CASE
            WHEN t.nu_dia = 12 THEN 1
            ELSE NULL::integer
        END) AS dia_12,
    count(
        CASE
            WHEN t.nu_dia = 13 THEN 1
            ELSE NULL::integer
        END) AS dia_13,
    count(
        CASE
            WHEN t.nu_dia = 14 THEN 1
            ELSE NULL::integer
        END) AS dia_14,
    count(
        CASE
            WHEN t.nu_dia = 15 THEN 1
            ELSE NULL::integer
        END) AS dia_15,
    count(
        CASE
            WHEN t.nu_dia = 16 THEN 1
            ELSE NULL::integer
        END) AS dia_16,
    count(
        CASE
            WHEN t.nu_dia = 17 THEN 1
            ELSE NULL::integer
        END) AS dia_17,
    count(
        CASE
            WHEN t.nu_dia = 18 THEN 1
            ELSE NULL::integer
        END) AS dia_18,
    count(
        CASE
            WHEN t.nu_dia = 19 THEN 1
            ELSE NULL::integer
        END) AS dia_19,
    count(
        CASE
            WHEN t.nu_dia = 20 THEN 1
            ELSE NULL::integer
        END) AS dia_20,
    count(
        CASE
            WHEN t.nu_dia = 21 THEN 1
            ELSE NULL::integer
        END) AS dia_21,
    count(
        CASE
            WHEN t.nu_dia = 22 THEN 1
            ELSE NULL::integer
        END) AS dia_22,
    count(
        CASE
            WHEN t.nu_dia = 23 THEN 1
            ELSE NULL::integer
        END) AS dia_23,
    count(
        CASE
            WHEN t.nu_dia = 24 THEN 1
            ELSE NULL::integer
        END) AS dia_24,
    count(
        CASE
            WHEN t.nu_dia = 25 THEN 1
            ELSE NULL::integer
        END) AS dia_25,
    count(
        CASE
            WHEN t.nu_dia = 26 THEN 1
            ELSE NULL::integer
        END) AS dia_26,
    count(
        CASE
            WHEN t.nu_dia = 27 THEN 1
            ELSE NULL::integer
        END) AS dia_27,
    count(
        CASE
            WHEN t.nu_dia = 28 THEN 1
            ELSE NULL::integer
        END) AS dia_28,
    count(
        CASE
            WHEN t.nu_dia = 29 THEN 1
            ELSE NULL::integer
        END) AS dia_29,
    count(
        CASE
            WHEN t.nu_dia = 30 THEN 1
            ELSE NULL::integer
        END) AS dia_30,
    count(
        CASE
            WHEN t.nu_dia = 31 THEN 1
            ELSE NULL::integer
        END) AS dia_31,
    count(*) AS mes
   FROM tb_fat_atendimento_individual
     JOIN tb_dim_profissional p ON tb_fat_atendimento_individual.co_dim_profissional_1 = p.co_seq_dim_profissional
     JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
     JOIN tb_dim_cbo c ON tb_fat_atendimento_individual.co_dim_cbo_1 = c.co_seq_dim_cbo
     JOIN tb_dim_municipio m ON tb_fat_atendimento_individual.co_dim_municipio = m.co_seq_dim_municipio
     JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
     JOIN tb_dim_unidade_saude ON tb_fat_atendimento_individual.co_dim_unidade_saude_1 = tb_dim_unidade_saude.co_seq_dim_unidade_saude
  GROUP BY m.no_municipio, tb_dim_unidade_saude.no_unidade_saude, tb_dim_unidade_saude.nu_cnes, p.nu_cns, p.no_profissional, (to_char(t.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(t.dt_registro::timestamp with time zone, 'MM'::text), c.no_cbo, c.nu_cbo, tb_dim_tipo_atendimento.ds_tipo_atendimento;

ALTER TABLE rl_esus."TIPO_ATEND_DIARIO_PROFISSIONAL"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."TIPO_ATEND_DIARIO_PROFISSIONAL" TO postgres;
GRANT ALL ON TABLE rl_esus."TIPO_ATEND_DIARIO_PROFISSIONAL" TO pmaq;
GRANT ALL ON TABLE rl_esus."TIPO_ATEND_DIARIO_PROFISSIONAL" TO relatorio;
