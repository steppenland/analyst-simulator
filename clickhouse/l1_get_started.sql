CREATE TABLE feed_actions (
    user_id     UInt64,
    post_id     UInt64,
    action      LowCardinality(String), -- LowCardinality оптимизирует хранение повторяющихся строк (like, view и т.д.)
    time        DateTime,
    gender      UInt8,                  -- 0/1 или используйте String / LowCardinality(String), если текст
    age         UInt8,
    country     LowCardinality(String),
    city        LowCardinality(String),
    os          LowCardinality(String),
    source      LowCardinality(String),
    exp_group   Int8
)
ENGINE = MergeTree()
ORDER BY (user_id, time);

SELECT *
FROM feed_actions
LIMIT 10;