#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "theme.h"
#include <QtSql>
#include <QtDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QString servername = "TRAVIS\\SQLEXPRESS";
    QString dbname = "RussT";
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    db.setConnectOptions();

    //Server=myServerAddress;Database=myDataBase;Trusted_Connection=True;
    QString dsn = QString("Server=%1;Database=%2Trusted_Connection=True;").arg(servername).arg(dbname);
    QQmlApplicationEngine engine;

    db.setDatabaseName(dsn);
    if (db.open())
    {
        qDebug() << "Database opened";
        db.close();
    }
    else
    {
        qDebug() << "Error: " << db.lastError();
    }

    theme CurrentTheme;
    engine.rootContext()->setContextProperty("CurrentTheme", &CurrentTheme);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
