#include "theme.h"

theme::theme()
    :m_fColor("lightseagreen"), m_bColor("#dadddc"), m_icon(1)
{

}

void theme::setThemeForeColor(QString c)
{
    m_fColor = c;
}


QString theme::getThemeForeColor()
{
    return m_fColor;
}

void theme::setThemeBackColor(QString c)
{
    m_bColor = c;
}


QString theme::getThemeBackColor()
{
    return m_bColor;
}

void theme::setThemeIcon(int i)
{
    m_icon = i;
}

int theme::getThemeIcon()
{
    return m_icon;
}
