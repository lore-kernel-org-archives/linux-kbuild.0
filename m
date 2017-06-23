Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57343 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753925AbdFWDWA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 23:22:00 -0400
MIME-Version: 1.0
In-Reply-To: <c3e8b332-3e13-3483-e893-c0aed498fbe9@infradead.org>
References: <c3e8b332-3e13-3483-e893-c0aed498fbe9@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 23 Jun 2017 12:21:48 +0900
Message-ID: <CAK7LNASXArO+hBs780zjXXUw+HxrhkLqn-T6vNiQWd_z1LUihQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix sparse warnings in nconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@oracle.com>

2017-05-23 10:44 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix sparse warnings in scripts/kconfig/nconf* ('make nconfig'):
>
> ../scripts/kconfig/nconf.c:1071:32: warning: Using plain integer as NULL pointer
> ../scripts/kconfig/nconf.c:1238:30: warning: Using plain integer as NULL pointer
> ../scripts/kconfig/nconf.c:511:51: warning: Using plain integer as NULL pointer
> ../scripts/kconfig/nconf.c:1460:6: warning: symbol 'setup_windows' was not declared. Should it be static?
> ../scripts/kconfig/nconf.c:274:12: warning: symbol 'current_instructions' was not declared. Should it be static?
> ../scripts/kconfig/nconf.c:308:22: warning: symbol 'function_keys' was not declared. Should it be static?
> ../scripts/kconfig/nconf.gui.c:132:17: warning: non-ANSI function declaration of function 'set_colors'
> ../scripts/kconfig/nconf.gui.c:195:24: warning: Using plain integer as NULL pointer
>
> nconf.gui.o before/after files are the same.
> nconf.o before/after files are the same until the 'static' function
> declarations are added.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied to linux-kbuild/fixes. Thanks!

-- 
Best Regards
Masahiro Yamada
