WITH tb_frec_valor AS (

    SELECT idCliente,
        count(DISTINCT substr(DtCriacao,0,11)) AS qtdeFrequencia,
        sum(CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS qtdePontosPos,
        sum(abs(QtdePontos)) AS qtdePontosAbs

    FROM transacoes

    WHERE DtCriacao < '2025-09-01'
    AND DtCriacao >= date('2025-09-01', '-28 days')

    GROUP BY 1

    ORDER BY qtdeFrequencia DESC
),

