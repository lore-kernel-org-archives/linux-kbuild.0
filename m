Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:44562 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751196AbeEVPgR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 11:36:17 -0400
Subject: Re: [PATCH v3 4/4] kconfig: refactor ncurses package checks for
 building mconf and nconf
References: <1526973741-664-1-git-send-email-yamada.masahiro@socionext.com>
 <1526973741-664-5-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8729f343-a206-0975-475b-a26e54e7b932@infradead.org>
Date: Tue, 22 May 2018 08:36:11 -0700
MIME-Version: 1.0
In-Reply-To: <1526973741-664-5-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

On 05/22/2018 12:22 AM, Masahiro Yamada wrote:
> The mconf (or its infrastructure, lxdiaglog) depends on the ncurses.
> Move and rename check-lxdialog.sh to mconf-cfg.sh to make it work in
> the same way as for qconf and gconf.
> 
> This commit fixes some more weirdnesses.
> 
> The nconf also needs ncurses packages.  HOSTLOADLIBES_nconf is set
> to the libraries needed for nconf, but the cflags is not explicitly
> set.  Actually, nconf relies on the check-lxdialog.sh for the proper
> cflags:
> 
> HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
>                     -DLOCALE
> 
> The code above passes the ncurses flags to all objects, even for conf,
> qconf, gconf.  Let's pass the ncurses flags only to mconf and nconf.
> 
> Currently, the presence of ncurses is not checked for nconf.  Let's
> show a prompt like the mconf case.
> 
> According to Randy's report, the shell scripts still need to carry
> the fallback code in case the pkg-config fails to find the ncurses
> packages.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Changes in v3:
>   - Squash two patches into one to not lose bisectability
> 
> Changes in v2:
>   - Restore fallback detection for openSUSE etc.
> 
>  scripts/kconfig/Makefile                   | 58 ++++++++-----------
>  scripts/kconfig/lxdialog/check-lxdialog.sh | 93 ------------------------------
>  scripts/kconfig/lxdialog/dialog.h          |  2 +-
>  scripts/kconfig/mconf-cfg.sh               | 44 ++++++++++++++
>  scripts/kconfig/nconf-cfg.sh               | 43 ++++++++++++++
>  5 files changed, 112 insertions(+), 128 deletions(-)
>  delete mode 100755 scripts/kconfig/lxdialog/check-lxdialog.sh
>  create mode 100755 scripts/kconfig/mconf-cfg.sh
>  create mode 100644 scripts/kconfig/nconf-cfg.sh


-- 
~Randy
