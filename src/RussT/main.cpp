#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "user.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QList<User> u;
    //engine.rootContext()->setContextProperty("Users", &u);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}

