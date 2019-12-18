-- View: rl_esus."CBO_PROCED_ODONTO_UNIDADE"
DROP VIEW if exists rl_esus."CBO_PROCED_ODONTO_UNIDADE";

CREATE OR REPLACE VIEW rl_esus."CBO_PROCED_ODONTO_UNIDADE" AS 
 SELECT tb_dim_municipio.no_municipio,
    uu.no_unidade_saude,
    uu.nu_cnes,
    cc.no_cbo,
    tb_dim_procedimento.ds_proced,
    tt.nu_ano,
    sum(
        CASE
            WHEN tt.nu_mes = 1 THEN proc.qt_procedimentos
            ELSE 0
        END) AS jan,
    sum(
        CASE
            WHEN tt.nu_mes = 2 THEN proc.qt_procedimentos
            ELSE 0
        END) AS fev,
    sum(
        CASE
            WHEN tt.nu_mes = 3 THEN proc.qt_procedimentos
            ELSE 0
        END) AS mar,
    sum(
        CASE
            WHEN tt.nu_mes = 4 THEN proc.qt_procedimentos
            ELSE 0
        END) AS abr,
    sum(
        CASE
            WHEN tt.nu_mes = 5 THEN proc.qt_procedimentos
            ELSE 0
        END) AS mai,
    sum(
        CASE
            WHEN tt.nu_mes = 6 THEN proc.qt_procedimentos
            ELSE 0
        END) AS jun,
    sum(
        CASE
            WHEN tt.nu_mes = 7 THEN proc.qt_procedimentos
            ELSE 0
        END) AS jul,
    sum(
        CASE
            WHEN tt.nu_mes = 8 THEN proc.qt_procedimentos
            ELSE 0
        END) AS ago,
    sum(
        CASE
            WHEN tt.nu_mes = 9 THEN proc.qt_procedimentos
            ELSE 0
        END) AS sete,
    sum(
        CASE
            WHEN tt.nu_mes = 10 THEN proc.qt_procedimentos
            ELSE 0
        END) AS outu,
    sum(
        CASE
            WHEN tt.nu_mes = 11 THEN proc.qt_procedimentos
            ELSE 0
        END) AS nov,
    sum(
        CASE
            WHEN tt.nu_mes = 12 THEN proc.qt_procedimentos
            ELSE 0
        END) AS dez,
    sum(proc.qt_procedimentos) AS qtd_total
   FROM tb_fat_atend_odonto_proced proc
     JOIN tb_dim_tempo tt ON proc.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_cbo cc ON proc.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_municipio ON proc.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
     JOIN tb_dim_unidade_saude uu ON proc.co_dim_unidade_saude_1 = uu.co_seq_dim_unidade_saude
     JOIN tb_dim_procedimento ON proc.co_dim_procedimento = tb_dim_procedimento.co_seq_dim_procedimento
  WHERE cc.nu_cbo::text = '223293'::text
  GROUP BY tb_dim_municipio.no_municipio, uu.no_unidade_saude, uu.nu_cnes, cc.no_cbo, tt.nu_ano, tb_dim_procedimento.ds_proced;

ALTER TABLE rl_esus."CBO_PROCED_ODONTO_UNIDADE"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."CBO_PROCED_ODONTO_UNIDADE" TO postgres;
GRANT ALL ON TABLE rl_esus."CBO_PROCED_ODONTO_UNIDADE" TO pmaq;
GRANT ALL ON TABLE rl_esus."CBO_PROCED_ODONTO_UNIDADE" TO relatorio;
