#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "theme.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    theme CurrentTheme;
    engine.rootContext()->setContextProperty("CurrentTheme", &CurrentTheme);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
