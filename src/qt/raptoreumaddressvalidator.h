// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017 The Raven Core developers
// Copyright (c) 2019 The Raptoreum Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef RAPTOREUM_QT_RAPTOREUMADDRESSVALIDATOR_H
#define RAPTOREUM_QT_RAPTOREUMADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class RaptoreumAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RaptoreumAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Raptoreum address widget validator, checks for a valid raptoreum address.
 */
class RaptoreumAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RaptoreumAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // RAPTOREUM_QT_RAPTOREUMADDRESSVALIDATOR_H
