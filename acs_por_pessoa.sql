-- View: rl_esus."ACS_POR_PESSOA"

DROP VIEW if exists rl_esus."ACS_POR_PESSOA";

CREATE OR REPLACE VIEW rl_esus."ACS_POR_PESSOA" AS 
 SELECT m.no_municipio,
    u.no_unidade_saude,
    tt.nu_ano,
    count(
        CASE
            WHEN tt.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS jan,
    count(
        CASE
            WHEN tt.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS fev,
    count(
        CASE
            WHEN tt.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS _mar,
    count(
        CASE
            WHEN tt.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS abr,
    count(
        CASE
            WHEN tt.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS mai,
    count(
        CASE
            WHEN tt.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS jun,
    count(
        CASE
            WHEN tt.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS jul,
    count(
        CASE
            WHEN tt.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS ago,
    count(
        CASE
            WHEN tt.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS sete,
    count(
        CASE
            WHEN tt.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS outu,
    count(
        CASE
            WHEN tt.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS nov,
    count(
        CASE
            WHEN tt.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS dez
   FROM tb_fat_visita_domiciliar
     JOIN tb_dim_tempo tt ON tb_fat_visita_domiciliar.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_municipio m ON tb_fat_visita_domiciliar.co_dim_municipio = m.co_seq_dim_municipio
     JOIN tb_dim_unidade_saude u ON tb_fat_visita_domiciliar.co_dim_unidade_saude = u.co_seq_dim_unidade_saude
  GROUP BY m.no_municipio, u.no_unidade_saude, tt.nu_ano;

ALTER TABLE rl_esus."ACS_POR_PESSOA"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."ACS_POR_PESSOA" TO postgres;
GRANT ALL ON TABLE rl_esus."ACS_POR_PESSOA" TO pmaq;
GRANT ALL ON TABLE rl_esus."ACS_POR_PESSOA" TO relatorio;
