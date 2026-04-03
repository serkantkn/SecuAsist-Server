import asyncio
import websockets
import json

async def connect():
    async with websockets.connect("ws://localhost:8765") as ws:
        auth_msg = {
            "type": "AUTH",
            "payload": {
                "deviceId": "tablet_A1",
                "deviceName": "Ziyaretçi Kapısı Tableti"
            }
        }
        await ws.send(json.dumps(auth_msg))
        print("Mock device connected.")
        # keep alive
        while True:
            await asyncio.sleep(10)

asyncio.run(connect())
