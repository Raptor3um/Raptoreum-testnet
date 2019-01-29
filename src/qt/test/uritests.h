// Copyright (c) 2009-2015 The Bitcoin Core developers
// Copyright (c) 2017 The Raven Core developers
// Copyright (c) 2019 The Raptoreum Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef RAPTOREUM_QT_TEST_URITESTS_H
#define RAPTOREUM_QT_TEST_URITESTS_H

#include <QObject>
#include <QTest>

class URITests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void uriTests();
};

#endif // RAPTOREUM_QT_TEST_URITESTS_H
