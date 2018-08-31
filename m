Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp2.it.da.ut.ee ([193.40.5.67]:49299 "EHLO smtp2.it.da.ut.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727363AbeHaOc6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Aug 2018 10:32:58 -0400
Date: Fri, 31 Aug 2018 13:26:04 +0300 (EEST)
From: Meelis Roos <mroos@linux.ee>
Subject: Re: [PATCH] kconfig: do not require pkg-config on make
 {menu,n}config
In-Reply-To: <1535708095-15847-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <alpine.LRH.2.21.1808311325260.31140@math.ut.ee>
References: <1535708095-15847-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org

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

Tested-by: Meelis Roos <mroos@linux.ee>

-- 
Meelis Roos (mroos@linux.ee)
