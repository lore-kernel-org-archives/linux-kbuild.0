Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga17.intel.com ([192.55.52.151]:46426 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727567AbfFDMux (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 08:50:53 -0400
From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 14/15] fixup: kbuild: add support for ensuring headers are self-contained
In-Reply-To: <20190604101409.2078-15-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com> <20190604101409.2078-15-yamada.masahiro@socionext.com>
Date: Tue, 04 Jun 2019 15:53:57 +0300
Message-ID: <871s094il6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Tue, 04 Jun 2019, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> This is needed to avoid regeneration of header-test C files.
>
> This will go away when Jani send v2.

Done, in reply to patch 13.

Thanks,
Jani.


>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/Makefile.build | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 2b4d56483c2e..067e98628664 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -298,10 +298,9 @@ $(obj)/%.lst: $(src)/%.c FORCE
>  # ---------------------------------------------------------------------------
>  
>  quiet_cmd_header_test = HDRTEST $@
> -      cmd_header_test = echo "\#include \"$(<F)\"" > $@
> +      cmd_header_test = echo "\#include \"$*.h\"" > $@
>  
> -# FIXME: would be nice to be able to limit this implicit rule to header-test-y
> -$(obj)/%.header_test.c: $(src)/%.h FORCE
> +$(obj)/%.header_test.c:
>  	$(call if_changed,header_test)
>  
>  # Compile assembler sources (.S)

-- 
Jani Nikula, Intel Open Source Graphics Center
