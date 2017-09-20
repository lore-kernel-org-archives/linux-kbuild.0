Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f179.google.com ([209.85.217.179]:51767 "EHLO
        mail-ua0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751633AbdITG5G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 02:57:06 -0400
Received: by mail-ua0-f179.google.com with SMTP id 72so1108401uas.8
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Sep 2017 23:57:06 -0700 (PDT)
MIME-Version: 1.0
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 20 Sep 2017 08:57:05 +0200
Message-ID: <CAFkk2KSTX_8UEhgWXeDgz3fQYBtGZuYLUAOSxHHKjczNhDzt3A@mail.gmail.com>
Subject: Kconfiglib updated with 'imply' support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,

Just as an FYI, I've done a long overdue update of Kconfiglib
(https://github.com/ulfalizer/Kconfiglib) to add 'imply' support. I
also fixed some other minor issues and added support for less
than/greater than comparisons (though nothing actually seems to use
them).

The test suite (https://github.com/ulfalizer/Kconfiglib/blob/master/testsuite.py)
passes again in 'obsessive' mode for the 4.13.0-rc5 kernel.

Cheers,
Ulf
