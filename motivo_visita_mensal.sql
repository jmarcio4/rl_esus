-- View: rl_esus."MOTIVO_VISITA_MENSAL"

DROP VIEW if exists rl_esus."MOTIVO_VISITA_MENSAL";

CREATE OR REPLACE VIEW rl_esus."MOTIVO_VISITA_MENSAL" AS 
 SELECT tb_cds_prof.nu_cnes,
    tb_dim_unidade_saude.no_unidade_saude,
    ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))) AS no_municipio,
    tb_cds_prof.nu_cns,
    pp.no_profissional AS no_pessoa_fisica,
    tb_cbo.co_cbo_2002,
    tb_cbo.no_cbo,
    tb_cds_visita_dom_motivo.no_cds_visita_dom_motivo,
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
        END) AS mar,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '04'::text THEN 1
            ELSE NULL::integer
        END) AS abr,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '05'::text THEN 1
            ELSE NULL::integer
        END) AS mai,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '06'::text THEN 1
            ELSE NULL::integer
        END) AS jun,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '07'::text THEN 1
            ELSE NULL::integer
        END) AS jul,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '08'::text THEN 1
            ELSE NULL::integer
        END) AS ag,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '09'::text THEN 1
            ELSE NULL::integer
        END) AS set,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '10'::text THEN 1
            ELSE NULL::integer
        END) AS outub,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '11'::text THEN 1
            ELSE NULL::integer
        END) AS nov,
    count(
        CASE
            WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'MM'::text) = '12'::text THEN 1
            ELSE NULL::integer
        END) AS dez,
    count(tb_cds_visita_dom_motivo.no_cds_visita_dom_motivo) AS "total_mÊs"
   FROM rl_cds_visita_dom_motivo
     LEFT JOIN tb_cds_visita_domiciliar ON rl_cds_visita_dom_motivo.co_cds_visita_domiciliar = tb_cds_visita_domiciliar.co_seq_cds_visita_domiciliar
     LEFT JOIN tb_cds_visita_dom_motivo ON rl_cds_visita_dom_motivo.co_cds_visita_dom_motivo = tb_cds_visita_dom_motivo.co_cds_visita_dom_motivo
     LEFT JOIN tb_cds_ficha_visita_domiciliar ON tb_cds_visita_domiciliar.co_cds_ficha_visita_domiciliar = tb_cds_ficha_visita_domiciliar.co_seq_cds_ficha_visita_dom
     LEFT JOIN tb_cds_prof ON tb_cds_ficha_visita_domiciliar.co_cds_prof = tb_cds_prof.co_seq_cds_prof
     LEFT JOIN tb_dim_unidade_saude ON tb_cds_prof.nu_cnes::text = tb_dim_unidade_saude.nu_cnes::text
     JOIN tb_dim_profissional pp ON tb_cds_prof.nu_cns::text = pp.nu_cns::text
     JOIN tb_cbo ON tb_cds_prof.nu_cbo_2002::text = tb_cbo.co_cbo_2002::text
  GROUP BY tb_cds_prof.nu_cns, to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'YYYY'::text), tb_cbo.co_cbo_2002, tb_cbo.no_cbo, ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))), tb_dim_unidade_saude.no_unidade_saude, pp.no_profissional, tb_cds_visita_dom_motivo.no_cds_visita_dom_motivo, tb_cds_prof.nu_cnes
  ORDER BY tb_cds_prof.nu_cnes, to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'YYYY'::text);

ALTER TABLE rl_esus."MOTIVO_VISITA_MENSAL"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."MOTIVO_VISITA_MENSAL" TO postgres;
GRANT ALL ON TABLE rl_esus."MOTIVO_VISITA_MENSAL" TO pmaq;
GRANT ALL ON TABLE rl_esus."MOTIVO_VISITA_MENSAL" TO relatorio;
