-- View: rl_esus.visitas_mes

DROP VIEW if exists rl_esus.visitas_mes;

CREATE OR REPLACE VIEW rl_esus.visitas_mes AS 
 SELECT 'VISITA POR PESSOA ACS' AS visitaacs,
    to_date((tt.nu_ano || '-'::text) || tt.nu_mes, 'yyyy-mm'::text) AS data_visita,
    (m.sg_mes::text || '-'::text) || tt.nu_ano AS mes,
    count(*) AS count
   FROM tb_fat_visita_domiciliar
     JOIN tb_dim_tempo tt ON tb_fat_visita_domiciliar.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN rl_esus.tb_mes m ON tt.nu_mes = m.co_mes
  GROUP BY to_date((tt.nu_ano || '-'::text) || tt.nu_mes, 'yyyy-mm'::text), (m.sg_mes::text || '-'::text) || tt.nu_ano
  ORDER BY to_date((tt.nu_ano || '-'::text) || tt.nu_mes, 'yyyy-mm'::text);

ALTER TABLE rl_esus.visitas_mes
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus.visitas_mes TO postgres;
GRANT ALL ON TABLE rl_esus.visitas_mes TO pmaq;
GRANT ALL ON TABLE rl_esus.visitas_mes TO relatorio;
