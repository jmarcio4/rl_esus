-- View: rl_esus."REL_PROCED_ODONTO_MES"

DROP VIEW if exists rl_esus."REL_PROCED_ODONTO_MES";

CREATE OR REPLACE VIEW rl_esus."REL_PROCED_ODONTO_MES" AS 
 SELECT tb_dim_municipio.no_municipio,
    uu.no_unidade_saude,
    pp.nu_cns,
    pp.no_profissional,
    cc.nu_cbo,
    cc.no_cbo,
    tt.nu_ano,
    uu.nu_cnes,
    tb_dim_procedimento.ds_proced,
    sum(
        CASE
            WHEN tt.nu_mes = 1 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_jan,
    sum(
        CASE
            WHEN tt.nu_mes = 2 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_fev,
    sum(
        CASE
            WHEN tt.nu_mes = 3 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_marc,
    sum(
        CASE
            WHEN tt.nu_mes = 4 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_abr,
    sum(
        CASE
            WHEN tt.nu_mes = 5 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_mai,
    sum(
        CASE
            WHEN tt.nu_mes = 6 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_jun,
    sum(
        CASE
            WHEN tt.nu_mes = 7 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_jul,
    sum(
        CASE
            WHEN tt.nu_mes = 8 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_ago,
    sum(
        CASE
            WHEN tt.nu_mes = 9 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_set,
    sum(
        CASE
            WHEN tt.nu_mes = 10 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_out,
    sum(
        CASE
            WHEN tt.nu_mes = 11 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_nov,
    sum(
        CASE
            WHEN tt.nu_mes = 12 THEN tb_fat_atend_odonto_proced.qt_procedimentos
            ELSE 0
        END) AS proced_dez
   FROM tb_fat_atend_odonto_proced
     JOIN tb_dim_profissional pp ON tb_fat_atend_odonto_proced.co_dim_profissional_1 = pp.co_seq_dim_profissional
     JOIN tb_dim_tempo tt ON tb_fat_atend_odonto_proced.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_procedimento ON tb_fat_atend_odonto_proced.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
     JOIN tb_dim_cbo cc ON tb_fat_atend_odonto_proced.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_unidade_saude uu ON tb_fat_atend_odonto_proced.co_dim_unidade_saude_1 = uu.co_seq_dim_unidade_saude
     JOIN tb_dim_municipio ON tb_fat_atend_odonto_proced.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
  GROUP BY tb_dim_municipio.no_municipio, tb_dim_procedimento.ds_proced, uu.no_unidade_saude, pp.nu_cns, pp.no_profissional, cc.nu_cbo, cc.no_cbo, tt.nu_ano, uu.nu_cnes;

ALTER TABLE rl_esus."REL_PROCED_ODONTO_MES"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."REL_PROCED_ODONTO_MES" TO postgres;
GRANT ALL ON TABLE rl_esus."REL_PROCED_ODONTO_MES" TO pmaq;
GRANT ALL ON TABLE rl_esus."REL_PROCED_ODONTO_MES" TO relatorio;
