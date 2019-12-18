-- View: rl_esus."PROCED_ODONTO_DIA"

DROP VIEW if exists rl_esus."PROCED_ODONTO_DIA";

CREATE OR REPLACE VIEW rl_esus."PROCED_ODONTO_DIA" AS 
 SELECT tb_dim_municipio.no_municipio,
    uu.no_unidade_saude,
    pp.nu_cns,
    pp.no_profissional,
    cc.nu_cbo,
    cc.no_cbo,
    (to_char(tt.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(tt.dt_registro::timestamp with time zone, 'MM'::text) AS comp,
    uu.nu_cnes,
    tb_dim_procedimento.ds_proced,
    sum(
        CASE
            WHEN tt.nu_dia = 1 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_1,
    sum(
        CASE
            WHEN tt.nu_dia = 2 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_2,
    sum(
        CASE
            WHEN tt.nu_dia = 3 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_3,
    sum(
        CASE
            WHEN tt.nu_dia = 4 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_4,
    sum(
        CASE
            WHEN tt.nu_dia = 5 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_5,
    sum(
        CASE
            WHEN tt.nu_dia = 6 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_6,
    sum(
        CASE
            WHEN tt.nu_dia = 7 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_7,
    sum(
        CASE
            WHEN tt.nu_dia = 8 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_8,
    sum(
        CASE
            WHEN tt.nu_dia = 9 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_9,
    sum(
        CASE
            WHEN tt.nu_dia = 10 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_10,
    sum(
        CASE
            WHEN tt.nu_dia = 11 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_11,
    sum(
        CASE
            WHEN tt.nu_dia = 12 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_12,
    sum(
        CASE
            WHEN tt.nu_dia = 13 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_13,
    sum(
        CASE
            WHEN tt.nu_dia = 14 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_14,
    sum(
        CASE
            WHEN tt.nu_dia = 15 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_15,
    sum(
        CASE
            WHEN tt.nu_dia = 16 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_16,
    sum(
        CASE
            WHEN tt.nu_dia = 17 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_17,
    sum(
        CASE
            WHEN tt.nu_dia = 18 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_18,
    sum(
        CASE
            WHEN tt.nu_dia = 19 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_19,
    sum(
        CASE
            WHEN tt.nu_dia = 20 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_20,
    sum(
        CASE
            WHEN tt.nu_dia = 21 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_21,
    sum(
        CASE
            WHEN tt.nu_dia = 22 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_22,
    sum(
        CASE
            WHEN tt.nu_dia = 23 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_23,
    sum(
        CASE
            WHEN tt.nu_dia = 24 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_24,
    sum(
        CASE
            WHEN tt.nu_dia = 25 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_25,
    sum(
        CASE
            WHEN tt.nu_dia = 26 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_26,
    sum(
        CASE
            WHEN tt.nu_dia = 27 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_27,
    sum(
        CASE
            WHEN tt.nu_dia = 28 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_28,
    sum(
        CASE
            WHEN tt.nu_dia = 29 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_29,
    sum(
        CASE
            WHEN tt.nu_dia = 30 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_30,
    sum(
        CASE
            WHEN tt.nu_dia = 31 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS dia_31
   FROM tb_fat_atend_odonto_proced
     JOIN tb_dim_profissional pp ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = pp.co_seq_dim_profissional
     JOIN tb_dim_tempo tt ON tb_fat_atend_odonto_proced.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
     JOIN tb_dim_cbo cc ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_unidade_saude uu ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = uu.co_seq_dim_unidade_saude
     JOIN tb_dim_municipio ON tb_fat_atend_odonto_proced.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
  GROUP BY tb_dim_municipio.no_municipio, (to_char(tt.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(tt.dt_registro::timestamp with time zone, 'MM'::text), tb_dim_procedimento.ds_proced, uu.no_unidade_saude, pp.nu_cns, pp.no_profissional, cc.nu_cbo, cc.no_cbo, tt.nu_ano, uu.nu_cnes;

ALTER TABLE rl_esus."PROCED_ODONTO_DIA"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."PROCED_ODONTO_DIA" TO postgres;
GRANT ALL ON TABLE rl_esus."PROCED_ODONTO_DIA" TO pmaq;
GRANT ALL ON TABLE rl_esus."PROCED_ODONTO_DIA" TO relatorio;
