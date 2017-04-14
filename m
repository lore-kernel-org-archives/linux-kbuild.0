Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:35050 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751445AbdDNRpA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 13:45:00 -0400
Received: by mail-pg0-f52.google.com with SMTP id 72so37616437pge.2
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Apr 2017 10:44:59 -0700 (PDT)
Date: Fri, 14 Apr 2017 10:44:58 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] kbuild: fix asm-offset generation to work with clang
Message-ID: <20170414174458.GL28657@google.com>
References: <1492149003-19136-1-git-send-email-yamada.masahiro@socionext.com>
 <1492149003-19136-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1492149003-19136-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, Jeroen Hofstee <jeroen@myspectrum.nl>, linux-kernel@vger.kernel.org

El Fri, Apr 14, 2017 at 02:50:03PM +0900 Masahiro Yamada ha dit:

> From: Jeroen Hofstee <jeroen@myspectrum.nl>
> 
> KBuild abuses the asm statement to write to a file and
> clang chokes about these invalid asm statements. Hack it
> even more by fooling this is actual valid asm code.
> 
> Signed-off-by: Jeroen Hofstee <jeroen@myspectrum.nl>
> [masahiro:
>  Import Jeroen's work for U-Boot:
>  http://patchwork.ozlabs.org/patch/375026/
>  Tweak sed script a little to drop garbage '#' for GCC case, like
>  #define NR_PAGEFLAGS 23 /* __NR_PAGEFLAGS       # */ ]
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>

I tested with x86 and arm64. Please note that two more changes are
needed to avoid breaking frv and um:

https://patchwork.kernel.org/patch/9660473/
https://patchwork.kernel.org/patch/9660503/

Maybe these should be part of your patch set? I only sent them out
separately to avoid cross posting with my initial patch for this issue
being a RFC.

Cheers

Matthias
