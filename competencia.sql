-- View: rl_esus.competencia

DROP VIEW if exists rl_esus.competencia;

CREATE OR REPLACE VIEW rl_esus.competencia AS 
 SELECT (to_char(tb_dim_tempo.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(tb_dim_tempo.dt_registro::timestamp with time zone, 'MM'::text) AS comp
   FROM tb_dim_tempo
  WHERE tb_dim_tempo.nu_ano::double precision <= date_part('year'::text, 'now'::text::date)
  GROUP BY (to_char(tb_dim_tempo.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(tb_dim_tempo.dt_registro::timestamp with time zone, 'MM'::text)
  ORDER BY (to_char(tb_dim_tempo.dt_registro::timestamp with time zone, 'yyyy'::text) || '-'::text) || to_char(tb_dim_tempo.dt_registro::timestamp with time zone, 'MM'::text) DESC
 LIMIT 24;

ALTER TABLE rl_esus.competencia
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus.competencia TO postgres;
GRANT ALL ON TABLE rl_esus.competencia TO relatorio;
