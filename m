Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:47446 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbeIACbV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Aug 2018 22:31:21 -0400
Subject: Re: [PATCH] kconfig: do not require pkg-config on make {menu,n}config
References: <1535708095-15847-1-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <70ea8a20-fd5a-1a78-3fda-5d3b060ba389@infradead.org>
Date: Fri, 31 Aug 2018 15:21:47 -0700
MIME-Version: 1.0
In-Reply-To: <1535708095-15847-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Meelis Roos <mroos@linux.ee>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org

On 08/31/2018 02:34 AM, Masahiro Yamada wrote:
> Meelis Roos reported a {menu,n}config regression:
> 
>  "I have libncurses devel package installed in the default system
>   location (as do 99%+ on actual developers probably) and in this
>   case, pkg-config is useless.  pkg-config is needed only when
>   libraries and headers are installed in non-default locations but
>   it is bad to require installation of pkg-config on all the machines
>   where make menuconfig would be possibly run."
> 
> For {menu,n}config, do not use pkg-config if it is not installed.
> For {g,x}config, keep checking pkg-config since we really rely on it
> for finding the installation paths of the required packages.
> 
> Fixes: 4ab3b80159d4 ("kconfig: check for pkg-config on make {menu,n,g,x}config")
> Reported-by: Meelis Roos <mroos@linux.ee>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thank you.

> ---
> 
>  Documentation/process/changes.rst  |  2 +-
>  scripts/kconfig/Makefile           |  1 -
>  scripts/kconfig/check-pkgconfig.sh |  8 --------
>  scripts/kconfig/gconf-cfg.sh       |  7 +++++++
>  scripts/kconfig/mconf-cfg.sh       | 25 ++++++++++++++-----------
>  scripts/kconfig/nconf-cfg.sh       | 25 ++++++++++++++-----------
>  scripts/kconfig/qconf-cfg.sh       |  7 +++++++
>  7 files changed, 43 insertions(+), 32 deletions(-)
>  delete mode 100644 scripts/kconfig/check-pkgconfig.sh


-- 
~Randy
