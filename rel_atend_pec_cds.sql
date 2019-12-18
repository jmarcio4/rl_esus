-- View: rl_esus."REL_ATEND_PEC_CDS"

DROP VIEW if exists rl_esus."REL_ATEND_PEC_CDS";

CREATE OR REPLACE VIEW rl_esus."REL_ATEND_PEC_CDS" AS 
 SELECT tb_dim_municipio.no_municipio,
    tb_dim_unidade_saude.no_unidade_saude,
    tb_dim_unidade_saude.nu_cnes,
    tb_dim_profissional.nu_cns,
    tb_dim_profissional.no_profissional,
    tb_dim_cbo.no_cbo,
    tb_dim_cbo.nu_cbo,
    tt.nu_ano,
    tb_dim_ciap.no_ciap,
    count(
        CASE
            WHEN tt.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS problemajan,
    count(
        CASE
            WHEN tt.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS problemafev,
    count(
        CASE
            WHEN tt.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS problemamar,
    count(
        CASE
            WHEN tt.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS problemaabr,
    count(
        CASE
            WHEN tt.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS problemamai,
    count(
        CASE
            WHEN tt.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS asproblemajun,
    count(
        CASE
            WHEN tt.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS problemajul,
    count(
        CASE
            WHEN tt.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS problemaago,
    count(
        CASE
            WHEN tt.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS problemaset,
    count(
        CASE
            WHEN tt.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS problemaout,
    count(
        CASE
            WHEN tt.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS problemanov,
    count(
        CASE
            WHEN tt.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS problemadez
   FROM tb_fat_atd_ind_problemas
     JOIN tb_dim_cbo ON tb_fat_atd_ind_problemas.co_dim_cbo_1 = tb_dim_cbo.co_seq_dim_cbo
     JOIN tb_dim_profissional ON tb_fat_atd_ind_problemas.co_dim_profissional_1 = tb_dim_profissional.co_seq_dim_profissional
     JOIN tb_dim_ciap ON tb_fat_atd_ind_problemas.co_dim_ciap = tb_dim_ciap.co_seq_dim_ciap
     JOIN tb_dim_tempo tt ON tb_fat_atd_ind_problemas.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_municipio ON tb_fat_atd_ind_problemas.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
     JOIN tb_dim_unidade_saude ON tb_fat_atd_ind_problemas.co_dim_unidade_saude_1 = tb_dim_unidade_saude.co_seq_dim_unidade_saude
  GROUP BY tb_dim_municipio.no_municipio, tb_dim_unidade_saude.no_unidade_saude, tb_dim_ciap.no_ciap, tb_dim_unidade_saude.nu_cnes, tb_dim_profissional.nu_cns, tb_dim_profissional.no_profissional, tb_dim_cbo.no_cbo, tt.nu_ano, tb_dim_cbo.nu_cbo
  ORDER BY tb_dim_unidade_saude.no_unidade_saude, tb_dim_profissional.no_profissional;

ALTER TABLE rl_esus."REL_ATEND_PEC_CDS"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."REL_ATEND_PEC_CDS" TO postgres;
GRANT ALL ON TABLE rl_esus."REL_ATEND_PEC_CDS" TO pmaq;
GRANT ALL ON TABLE rl_esus."REL_ATEND_PEC_CDS" TO relatorio;
