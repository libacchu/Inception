<?php

use Redis;

$redis = new Redis();
$redis->connect('redis', 6379);

$redis->auth('redispass54321');

if ($redis->ping()) {
    echo "Connected to Redis";
} else {
    echo "Unable to connect to Redis";
}

?>
