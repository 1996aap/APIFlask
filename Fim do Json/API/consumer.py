import pika
import json
import config as cfg

# Connect to RabbitMQ and create channel
connection = pika.BlockingConnection(pika.ConnectionParameters(host=cfg.RABBIT_HOST))
channel = connection.channel()

# Declare and listen queue
channel.queue_declare(queue=cfg.QUEUE_TOPIC)

print(' [*] Waiting for messages. To exit press CTRL+C')

# Function process and print data
def callback(ch, method, properties, body):
    print("Method: {}".format(method))
    print("Properties: {}".format(properties))

    data = json.loads(body)
    print("Produto: {}".format(data['Produto']))
    print("Fabricacao: {}".format(data['Fabricacao']))
    print('Validade: {}'.format(data['Validade']))
    print('Lote: {}'.format(data['Lote']))
    print('Quantidade: {}'.format(data['Quantidade']))
    print('Relacional: {}'.format(data['Relacional']))
    
# Listen and receive data from queue
# channel.basic_consume(callback,queue=cfg.QUEUE_TOPIC,no_ack=True)
channel.basic_consume(cfg.QUEUE_TOPIC, callback,auto_ack=True)
channel.start_consuming()