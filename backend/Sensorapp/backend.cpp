#include <QtQml>
#include <QtQml/QQmlContext>
#include "backend.h"
#include "mytype.h"

#include "qpplotitem.h"
#include "qpscrollingcurve.h"
#include "qpcurve.h"
#include "qpscaleengine.h"
#include "qpfixedscaleengine.h"
#include "qptightscaleengine.h"
#include "mqtt/mqtt.h"

void BackendPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("Sensorapp"));

//    Q_ASSERT(uri == QLatin1String("QuickPlot"));
    qmlRegisterType<MyType>(uri, 1, 0, "MyType");
    qmlRegisterType<QPPlotItem>(uri, 1, 0, "PlotItem");
    qmlRegisterType<QPScrollingCurve>(uri, 1, 0, "ScrollingCurve");
    qmlRegisterType<QPCurve>(uri, 1, 0, "Curve");
    qmlRegisterType<QPScaleEngine>(uri, 1, 0, "ScaleEngine");
    qmlRegisterType<QPFixedScaleEngine>(uri, 1, 0, "FixedScaleEngine");
    qmlRegisterType<QPTightScaleEngine>(uri, 1, 0, "TightScaleEngine");

    qmlRegisterType<MQTT>(uri, 1, 0, "MQTT");
}

void BackendPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}

