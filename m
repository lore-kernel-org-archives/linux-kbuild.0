Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f44.google.com ([209.85.167.44]:38602 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732356AbeKNApA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Nov 2018 19:45:00 -0500
Received: by mail-lf1-f44.google.com with SMTP id p86so9009892lfg.5
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Nov 2018 06:46:31 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 13 Nov 2018 15:46:19 +0100
Message-ID: <CA+icZUUPaoEf0JzXJO6T5xBBrr8tcw2NmNXBk4=HD6WBbLtEdw@mail.gmail.com>
Subject: builddeb: Missing arch/x86/kernel/macros.s when building modules with dkms
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org

Hi,

I wanted to compile acpi-call-dkms on Debian/testing AMD64 with
clang-8/experimental.

When doing a...

# LC_ALL=C dkms install -m acpi-call -v 1.1.0 -k 4.20.0-rc2-2-amd64-cbl

...I saw that arch/x86/kernel/macros.s file was missing.

My workaround was...

$ cd $BUILD_DIR
$ sudo cp -av arch/x86/kernel/macros.s
/usr/src/linux-headers-4.20.0-rc2-2-amd64-cbl/arch/x86/kernel/

I guess the generated linux-headers debian package is missing this file.

I wanted to let you and others know.

Regards,
- Sedat -
