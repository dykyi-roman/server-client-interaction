<?php

declare(strict_types=1);

namespace App\Domain\Notification;

use App\Domain\PayloadGenerator;
use App\Domain\VO\OperationTime;
use WebSocket\Client;

final readonly class WebsocketPusher
{
    private Client $webSocketClient;

    public function __construct(
        private PayloadGenerator $payload,
        string $websocketServerUrl,
    ) {
        $this->webSocketClient = new Client($websocketServerUrl);
    }

    public function __invoke(int $count): OperationTime
    {
        return new OperationTime(function (int $count): void {
            $i = 1;
            while ($i <= $count) {
                $this->webSocketClient->send($this->payload->generateRequest());
                $i++;
            }
        }, $count);
    }
}
