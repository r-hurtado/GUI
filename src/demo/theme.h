#ifndef THEME_H
#define THEME_H

#include <QString>
#include <QObject>

class theme : public QObject
{
    Q_OBJECT
public:
    theme();

public slots:
    void setThemeForeColor(QString);
    QString getThemeForeColor();
    void setThemeBackColor(QString);
    QString getThemeBackColor();
    void setThemeIcon(int);
    int getThemeIcon();

private:
    QString m_fColor;
    QString m_bColor;
    int m_icon;
};

#endif // THEME_H
