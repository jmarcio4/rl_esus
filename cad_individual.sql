-- View: rl_esus."CAD_INDIVIDUAL"

DROP VIEW if exists rl_esus."CAD_INDIVIDUAL";

CREATE OR REPLACE VIEW rl_esus."CAD_INDIVIDUAL" AS 
 SELECT tb_cds_prof.nu_cnes,
    ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))) AS no_municipio,
    tb_dim_unidade_saude.no_unidade_saude,
    tb_cds_prof.nu_cns,
    tb_cbo.no_cbo,
    p.no_profissional AS no_pessoa_fisica,
    count(tb_cds_cad_individual.co_unico_ficha) AS qunatidadedecadastro
   FROM tb_cidadao
     JOIN tb_cds_cad_individual ON tb_cidadao.co_unico_ultima_ficha::text = tb_cds_cad_individual.co_unico_ficha::text
     LEFT JOIN tb_cds_prof ON tb_cds_cad_individual.co_cds_prof_cadastrante = tb_cds_prof.co_seq_cds_prof
     LEFT JOIN tb_dim_unidade_saude ON tb_cds_prof.nu_cnes::text = tb_dim_unidade_saude.nu_cnes::text
     JOIN tb_dim_profissional p ON tb_cds_prof.nu_cns::text = p.nu_cns::text
     JOIN tb_cbo ON tb_cds_prof.nu_cbo_2002::text = tb_cbo.co_cbo_2002::text
  GROUP BY tb_cds_prof.nu_cnes, ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))), tb_cds_prof.nu_cns, p.no_profissional, tb_dim_unidade_saude.no_unidade_saude, tb_cbo.no_cbo
  ORDER BY tb_cds_prof.nu_cnes, p.no_profissional;

ALTER TABLE rl_esus."CAD_INDIVIDUAL"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."CAD_INDIVIDUAL" TO postgres;
GRANT ALL ON TABLE rl_esus."CAD_INDIVIDUAL" TO pmaq;
GRANT ALL ON TABLE rl_esus."CAD_INDIVIDUAL" TO relatorio;
