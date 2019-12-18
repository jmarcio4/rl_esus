-- View: rl_esus."TIPO_ODONTO_DIARIO"

DROP VIEW if exists rl_esus."TIPO_ODONTO_DIARIO";

CREATE OR REPLACE VIEW rl_esus."TIPO_ODONTO_DIARIO" AS 
 SELECT tb_dim_municipio.no_municipio,
    uu.nu_cnes,
    uu.no_unidade_saude,
    pp.nu_cns,
    pp.no_profissional,
    cc.no_cbo,
    cc.nu_cbo,
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
    count(*) AS mensal
   FROM tb_fat_atendimento_odonto
     JOIN tb_dim_profissional pp ON tb_fat_atendimento_odonto.co_dim_profissional_1 = pp.co_seq_dim_profissional
     JOIN tb_dim_tempo t ON tb_fat_atendimento_odonto.co_dim_tempo = t.co_seq_dim_tempo
     JOIN tb_dim_cbo cc ON tb_fat_atendimento_odonto.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_municipio ON tb_fat_atendimento_odonto.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
     JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_odonto.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
     JOIN tb_dim_unidade_saude uu ON tb_fat_atendimento_odonto.co_dim_unidade_saude_1 = uu.co_seq_dim_unidade_saude
  GROUP BY tb_dim_municipio.no_municipio, uu.no_unidade_saude, pp.nu_cns, pp.no_profissional, cc.nu_cbo, cc.no_cbo, (to_char(t.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(t.dt_registro::timestamp with time zone, 'MM'::text), uu.nu_cnes, tb_dim_tipo_atendimento.ds_tipo_atendimento;

ALTER TABLE rl_esus."TIPO_ODONTO_DIARIO"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."TIPO_ODONTO_DIARIO" TO postgres;
GRANT ALL ON TABLE rl_esus."TIPO_ODONTO_DIARIO" TO pmaq;
GRANT ALL ON TABLE rl_esus."TIPO_ODONTO_DIARIO" TO relatorio;
