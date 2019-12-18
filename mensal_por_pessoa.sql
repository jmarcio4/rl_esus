-- View: rl_esus."MENSAL_POR_PESSOA"

DROP VIEW if exists rl_esus."MENSAL_POR_PESSOA";

CREATE OR REPLACE VIEW rl_esus."MENSAL_POR_PESSOA" AS 
 SELECT tb_cds_prof.nu_cnes,
    ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))) AS no_municipio,
    tb_dim_unidade_saude.no_unidade_saude,
    tb_cds_prof.nu_cns,
    tb_prof.no_profissional AS no_pessoa_fisica,
    tb_cbo.co_cbo_2002,
    tb_cbo.no_cbo,
    tb_cds_visita_dom_desfecho.no_cds_visita_dom_desfecho,
    to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'YYYY'::text) AS comp,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '01'::text THEN 1
            ELSE NULL::integer
        END) AS jan,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '02'::text THEN 1
            ELSE NULL::integer
        END) AS fev,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '03'::text THEN 1
            ELSE NULL::integer
        END) AS marc,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '04'::text THEN 1
            ELSE NULL::integer
        END) AS abril,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '05'::text THEN 1
            ELSE NULL::integer
        END) AS maio,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '06'::text THEN 1
            ELSE NULL::integer
        END) AS jun,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '07'::text THEN 1
            ELSE NULL::integer
        END) AS julho,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '08'::text THEN 1
            ELSE NULL::integer
        END) AS agosto,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '09'::text THEN 1
            ELSE NULL::integer
        END) AS setembro,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '10'::text THEN 1
            ELSE NULL::integer
        END) AS outubro,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '11'::text THEN 1
            ELSE NULL::integer
        END) AS novembro,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '12'::text THEN 1
            ELSE NULL::integer
        END) AS dez,
    count(DISTINCT tb_cds_visita_domiciliar.co_seq_cds_visita_domiciliar) AS total_mes
   FROM tb_cds_visita_domiciliar
     JOIN tb_cds_visita_dom_desfecho ON tb_cds_visita_domiciliar.co_cds_visita_dom_desfecho = tb_cds_visita_dom_desfecho.co_cds_visita_dom_desfecho
     JOIN tb_cds_ficha_visita_domiciliar ON tb_cds_visita_domiciliar.co_cds_ficha_visita_domiciliar = tb_cds_ficha_visita_domiciliar.co_seq_cds_ficha_visita_dom
     LEFT JOIN tb_cds_prof ON tb_cds_ficha_visita_domiciliar.co_cds_prof = tb_cds_prof.co_seq_cds_prof
     LEFT JOIN tb_dim_unidade_saude ON tb_cds_prof.nu_cnes::text = tb_dim_unidade_saude.nu_cnes::text
     JOIN tb_prof ON tb_cds_prof.nu_cns::text = tb_prof.nu_cns::text AND tb_prof.nu_cpf IS NOT NULL
     JOIN tb_cbo ON tb_cds_prof.nu_cbo_2002::text = tb_cbo.co_cbo_2002::text
  GROUP BY ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))), tb_cbo.co_cbo_2002, tb_cbo.no_cbo, tb_cds_visita_dom_desfecho.no_cds_visita_dom_desfecho, tb_cds_prof.nu_cnes, tb_dim_unidade_saude.no_unidade_saude, tb_cds_prof.nu_cns, tb_prof.no_profissional, to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'YYYY'::text)
  ORDER BY tb_cds_prof.nu_cnes, tb_cds_prof.nu_cns, to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'YYYY'::text);

ALTER TABLE rl_esus."MENSAL_POR_PESSOA"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."MENSAL_POR_PESSOA" TO postgres;
GRANT ALL ON TABLE rl_esus."MENSAL_POR_PESSOA" TO pmaq;
GRANT ALL ON TABLE rl_esus."MENSAL_POR_PESSOA" TO relatorio;
