Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgFSHrk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 03:47:40 -0400
Date: Fri, 19 Jun 2020 00:47:38 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "Makefile: install modules.builtin even if
 CONFIG_MODULES=n"
Message-ID: <20200619074738.GB1427@infradead.org>
References: <20200619044823.863461-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619044823.863461-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Fri, Jun 19, 2020 at 01:48:23PM +0900, Masahiro Yamada wrote:
> This reverts commit e0b250b57dcf403529081e5898a9de717f96b76b.
> 
> Now that "make install" copies modules.builtin to $(INSTALL_MOD_PATH),
> it breaks systems that do not set INSTALL_MOD_PATH for "make install".
> 
> While modules.builtin is useful for CONFIG_MODULES=n, this way gives
> unexpected impact to existing systems. Maybe "make modules_install"
> can install modules.builtin irrespective of CONFIG_MODULES as Jonas
> originally suggested. Anyway, this commit should be reverted ASAP.

What is the "unexpected impact?  This commit log needs to explain
that.
