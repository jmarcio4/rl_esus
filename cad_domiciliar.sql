-- View: rl_esus."CAD_DOMICILIAR"

DROP VIEW if exists rl_esus."CAD_DOMICILIAR";

CREATE OR REPLACE VIEW rl_esus."CAD_DOMICILIAR" AS 
 SELECT tb_cds_prof.nu_cnes,
    ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))) AS no_municipio,
    tb_dim_unidade_saude.no_unidade_saude,
    p.nu_cns,
    tb_cbo.no_cbo,
    p.no_profissional AS no_pessoa_fisica,
    count(tb_cds_cad_domiciliar.co_unico_ficha) AS qunatidadedecadastro
   FROM tb_cds_cad_domiciliar
     JOIN tb_cds_domicilio ON tb_cds_cad_domiciliar.co_unico_ficha::text = tb_cds_domicilio.co_unico_ultima_ficha::text
     LEFT JOIN tb_cds_prof ON tb_cds_cad_domiciliar.co_cds_prof_cadastrante = tb_cds_prof.co_seq_cds_prof
     JOIN tb_dim_unidade_saude ON tb_cds_prof.nu_cnes::text = tb_dim_unidade_saude.nu_cnes::text
     LEFT JOIN tb_dim_profissional p ON tb_cds_prof.nu_cns::text = p.nu_cns::text
     LEFT JOIN tb_cbo ON tb_cds_prof.nu_cbo_2002::text = tb_cbo.co_cbo_2002::text
  GROUP BY tb_cds_prof.nu_cnes, ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))), tb_dim_unidade_saude.no_unidade_saude, p.nu_cns, tb_cbo.no_cbo, p.no_profissional
  ORDER BY tb_cds_prof.nu_cnes;

ALTER TABLE rl_esus."CAD_DOMICILIAR"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."CAD_DOMICILIAR" TO postgres;
GRANT ALL ON TABLE rl_esus."CAD_DOMICILIAR" TO pmaq;
GRANT ALL ON TABLE rl_esus."CAD_DOMICILIAR" TO relatorio;
