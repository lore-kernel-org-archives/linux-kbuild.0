Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgEUWSj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 18:18:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C685BC061A0E
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:18:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t7so3556080plr.0
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:18:39 -0700 (PDT)
Date: Thu, 21 May 2020 15:18:37 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Message-ID: <202005211515.481BD90@keescook>
References: <20200521202716.193316-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521202716.193316-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 21, 2020 at 01:27:16PM -0700, Sami Tolvanen wrote:
> Instead of linking all compilation units again each time vmlinux_link is
> called, reuse vmlinux.o from modpost_link.
> 
> With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> in the time spent in vmlinux_link).

BTW, I'll see this most in that it knocks about 6% off my "I changed
1 .c file and now I'm rebuilding" workflow time (which is obviously
dominated by linking), from 25 seconds to 23.5 seconds. And since most
of those seconds are spent staring at the build, it feels like a lot
more. ;)

-- 
Kees Cook
