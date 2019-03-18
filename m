Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:48378 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbfCRIqZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 04:46:25 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Mar 2019 17:45:46 +0900
Message-ID: <CAK7LNAS5-e6QcJqSg_c2NBS=11ZZ-KFWLqDZYxWTu0wPFHg=cQ@mail.gmail.com>
Subject: Enabling -Wint-in-bool-context
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Arnd,

I saw several commits from you
fixing -Wint-in-bool-context warnings.
Thanks!


I guess we are almost ready to remove

KBUILD_CFLAGS   += $(call cc-disable-warning, int-in-bool-context)


In there any concern about re-enabling
this warning?


When I asked 0-day bot to test it some days ago,
I just got a report
for drivers/net/ethernet/mellanox/mlxsw/.

Perhaps, you may have better test coverage
and have noticed more warnings, though.

--
Best Regards
Masahiro Yamada
