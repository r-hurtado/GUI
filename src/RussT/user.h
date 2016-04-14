#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QList>

class User : public QObject
{
    Q_OBJECT
public:
    User();     
    User (const User &);
public slots:
    void setUsername(QString);
    QString getUsername();
    void setEmail(QString);
    QString getEmail();
    void setPasswd(QString);
    QString getPasswd();
    void setProfilePic(QString);
    QString getProfilePic();

    void setUserInfo(QString user_info);
    QString getUserInfo();
    void setImages(const QList<int> &images);
    QList<int> getImages() const;
    void setFav_images(const QList<int> &fav_images);
    QList<int> getFav_images() const;
    void setUser_bff(const QList<User> &user_bff);
    QList<User> getUser_bff() const;

private:
    QString m_username;
    QString m_email;
    QString m_passwd;
    QString m_profile_pic;
    QString m_user_info;
    QList<int> m_images;
    QList<int> m_fav_images;
    QList<User> m_user_bff;
};

#endif // USER_H
