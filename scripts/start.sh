sudo yum install -y java-17-amazon-corretto-devel.x86_64

REPOSITORY="/home/ec2-user/ci-cd-demo-server"

cp $REPOSITORY/zip/*.jar $REPOSITORY/

JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)

sudo chmod +x $JAR_NAME

nohup java -jar -Dspring.profiles.active=dev $JAR_NAME --server.port=8080 \
$JAR_NAME > $REPOSITORY/nohup.out 2>&1 &