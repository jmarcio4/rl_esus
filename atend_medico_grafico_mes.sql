-- View: rl_esus."ATEND_MEDICO_GRAFICO_MES"

DROP VIEW if exists rl_esus."ATEND_MEDICO_GRAFICO_MES";

CREATE OR REPLACE VIEW rl_esus."ATEND_MEDICO_GRAFICO_MES" AS 
 SELECT 'ATENDIMENTO POR PESSOA MÉDICO' AS medico,
    to_date((tt.nu_ano || '-'::text) || tt.nu_mes, 'yyyy-MM'::text) AS data,
    cc.nu_cbo,
    count(*) AS count
   FROM tb_fat_atendimento_individual
     JOIN tb_dim_tempo tt ON tb_fat_atendimento_individual.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_cbo cc ON tb_fat_atendimento_individual.co_dim_cbo_1 = cc.co_seq_dim_cbo
  GROUP BY to_date((tt.nu_ano || '-'::text) || tt.nu_mes, 'yyyy-MM'::text), cc.nu_cbo;

ALTER TABLE rl_esus."ATEND_MEDICO_GRAFICO_MES"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."ATEND_MEDICO_GRAFICO_MES" TO postgres;
GRANT ALL ON TABLE rl_esus."ATEND_MEDICO_GRAFICO_MES" TO pmaq;
GRANT ALL ON TABLE rl_esus."ATEND_MEDICO_GRAFICO_MES" TO relatorio;
