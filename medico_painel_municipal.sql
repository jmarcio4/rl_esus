-- View: rl_esus."MEDICO_PAINEL_MUNICIPAL"

DROP VIEW if exists rl_esus."MEDICO_PAINEL_MUNICIPAL";

CREATE OR REPLACE VIEW rl_esus."MEDICO_PAINEL_MUNICIPAL" AS 
 SELECT tb_dim_municipio_1.no_municipio,
    tb_dim_cbo.no_cbo,
    tt.nu_mes,
    count(*) AS atendimentos,
    tt.nu_ano
   FROM tb_fat_atendimento_individual
     JOIN tb_dim_tempo tt ON tb_fat_atendimento_individual.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
     JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
     JOIN tb_dim_cbo ON tb_fat_atendimento_individual.co_dim_cbo_1 = tb_dim_cbo.co_seq_dim_cbo
  WHERE tb_dim_cbo.no_cbo::text = 'MÉDICO DA ESTRATÉGIA DE SAÚDE DA FAMÍLIA'::text AND tt.nu_ano::double precision = date_part('year'::text, 'now'::text::date) AND tt.nu_mes::double precision = date_part('month'::text, 'now'::text::date)
  GROUP BY tb_dim_municipio_1.no_municipio, tb_dim_cbo.no_cbo, tt.nu_ano, tt.nu_mes;

ALTER TABLE rl_esus."MEDICO_PAINEL_MUNICIPAL"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."MEDICO_PAINEL_MUNICIPAL" TO postgres;
GRANT ALL ON TABLE rl_esus."MEDICO_PAINEL_MUNICIPAL" TO pmaq;
GRANT ALL ON TABLE rl_esus."MEDICO_PAINEL_MUNICIPAL" TO relatorio;
