-- View: rl_esus."ATIVIDADE_SUP"

DROP VIEW if exists rl_esus."ATIVIDADE_SUP";

CREATE OR REPLACE VIEW rl_esus."ATIVIDADE_SUP" AS 
 SELECT ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))) AS no_municipio,
    tb_cds_prof.nu_cnes,
    tb_dim_unidade_saude.no_unidade_saude,
    tb_cbo.co_cbo_2002,
    tb_cbo.no_cbo,
    p.no_profissional AS no_pessoa_fisica,
    tb_cds_prof.nu_cns,
    tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col,
    tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica,
    to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer AS nu_ano,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '01'::text THEN 1
            ELSE NULL::integer
        END) AS jan,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '02'::text THEN 1
            ELSE NULL::integer
        END) AS fev,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '03'::text THEN 1
            ELSE NULL::integer
        END) AS masrc,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '04'::text THEN 1
            ELSE NULL::integer
        END) AS abril,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '05'::text THEN 1
            ELSE NULL::integer
        END) AS maio,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '06'::text THEN 1
            ELSE NULL::integer
        END) AS jun,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '07'::text THEN 1
            ELSE NULL::integer
        END) AS julho,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '08'::text THEN 1
            ELSE NULL::integer
        END) AS agost,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '09'::text THEN 1
            ELSE NULL::integer
        END) AS setembro,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '10'::text THEN 1
            ELSE NULL::integer
        END) AS outub,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'MM'::text) = '11'::text THEN 1
            ELSE NULL::integer
        END) AS novem,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'mm'::text) = '12'::text THEN 1
            ELSE NULL::integer
        END) AS dez,
    count(*) AS total_ano
   FROM tb_cds_tipo_ativ_col
     JOIN tb_cds_ficha_ativ_col tb_cds_ficha_ativ_col ON tb_cds_tipo_ativ_col.co_cds_tipo_ativ_col = tb_cds_ficha_ativ_col.tp_cds_ativ_col
     JOIN tb_cds_prof tb_cds_prof ON tb_cds_ficha_ativ_col.co_cds_prof_responsavel = tb_cds_prof.co_seq_cds_prof
     LEFT JOIN rl_cds_ficha_ativ_col_pratica ON tb_cds_ficha_ativ_col.co_seq_cds_ficha_ativ_col = rl_cds_ficha_ativ_col_pratica.co_cds_ficha_ativ_col
     LEFT JOIN tb_cds_ativ_col_pratica ON rl_cds_ficha_ativ_col_pratica.co_cds_ativ_col_pratica = tb_cds_ativ_col_pratica.co_cds_ativ_col_pratica
     LEFT JOIN tb_cbo ON tb_cds_prof.nu_cbo_2002::text = tb_cbo.co_cbo_2002::text
     LEFT JOIN tb_dim_profissional p ON tb_cds_prof.nu_cns::text = p.nu_cns::text
     LEFT JOIN tb_dim_unidade_saude ON tb_cds_prof.nu_cnes::text = tb_dim_unidade_saude.nu_cnes::text
  GROUP BY tb_cds_prof.nu_cnes, tb_dim_unidade_saude.no_unidade_saude, tb_cbo.co_cbo_2002, tb_cbo.no_cbo, p.no_profissional, tb_cds_prof.nu_cns, tb_cds_tipo_ativ_col.no_cds_tipo_ativ_col, tb_cds_ativ_col_pratica.no_cds_ativ_col_pratica, to_char(tb_cds_ficha_ativ_col.dt_ativ_col, 'YYYY'::text)::integer
  ORDER BY tb_cds_prof.nu_cnes, tb_cds_prof.nu_cns;

ALTER TABLE rl_esus."ATIVIDADE_SUP"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."ATIVIDADE_SUP" TO postgres;
GRANT ALL ON TABLE rl_esus."ATIVIDADE_SUP" TO pmaq;
GRANT ALL ON TABLE rl_esus."ATIVIDADE_SUP" TO relatorio;
