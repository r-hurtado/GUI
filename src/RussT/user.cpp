#include "user.h"

User::User()
    :m_username(""), m_email(""), m_passwd(""), m_profile_pic(""), m_user_info("")
{
    m_images.clear();
    m_fav_images.clear();
    m_user_bff.clear();
}

User::User(const User &user) : QObject()
{
    m_username = user.m_username;
    m_email = user.m_email;
    m_passwd = user.m_passwd;
    m_profile_pic = user.m_profile_pic;
    m_user_info = user.m_user_info;
    m_images = user.m_images;
    m_fav_images = user.m_fav_images;
    m_user_bff = user.m_user_bff;
}

void User::setUserInfo(QString user_info)
{
    m_user_info = user_info;
}

QString User::getUserInfo()
{
    return m_user_info;
}

QList<User> User::getUser_bff() const
{
    return m_user_bff;
}

void User::setUser_bff(const QList<User> &user_bff)
{
    m_user_bff = user_bff;
}

QList<int> User::getFav_images() const
{
    return m_fav_images;
}

void User::setFav_images(const QList<int> &fav_images)
{
    m_fav_images = fav_images;
}

QList<int> User::getImages() const
{
    return m_images;
}

void User::setImages(const QList<int> &images)
{
    m_images = images;
}

void User::setUsername(QString name)
{
    m_username = name;
}

QString User::getUsername()
{
    return m_username;
}

void User::setEmail(QString email)
{
    m_email = email;
}

QString User::getEmail()
{
    return m_email;
}

void User::setPasswd(QString passwd)
{
    m_passwd = passwd;
}

QString User::getPasswd()
{
    return m_passwd;
}

void User::setProfilePic(QString profile_pic)
{
    m_profile_pic = profile_pic;
}

QString User::getProfilePic()
{
    return m_profile_pic;
}
