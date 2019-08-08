Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:54085 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHHGan (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 02:30:43 -0400
MIME-Version: 1.0
References: <20190806100323.22919-1-yamada.masahiro@socionext.com> <20190806100323.22919-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190806100323.22919-3-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Aug 2019 15:29:52 +0900
Message-ID: <CAK7LNARrC2h_qtFaY6=2+YVz2kJcMK_+QZ+WJEba8T1AH_Nvjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: show hint if subdir-y/m is used to visit
 module Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Aug 6, 2019 at 7:03 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Since commit ff9b45c55b26 ("kbuild: modpost: read modules.order instead
> of $(MODVERDIR)/*.mod"), a module is no longer built in the following
> pattern:
>
>   [Makefile]
>   subdir-y := some-module
>
>   [some-module/Makefile]
>   obj-m := some-module.o
>
> You cannot write Makefile this way in upstream because modules.order is
> not correctly generated. subdir-y is used to descend to a sub-directory
> that builds tools, device trees, etc.
>
> For external modules, the modules order does not matter. So, the
> Makefile above was known to work.
>
> I believe the Makefile should be re-written as follows:
>
>   [Makefile]
>   obj-m := some-module/
>
>   [some-module/Makefile]
>   obj-m := some-module.o
>
> However, people will have no idea if their Makefile suddenly stops
> working. In fact, I received questions from multiple people.
>
> Show a warning if obj-m is specified in a Makefile visited by subdir-y
> or subdir-m.
>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

This produces false-positive warnings for single-targets.
I will fix up as follows:


diff --git a/Makefile b/Makefile
index 0e37ad2f77bf..fac25e279da6 100644
--- a/Makefile
+++ b/Makefile
@@ -1783,7 +1783,7 @@ PHONY += /
 /: ./

 %/: prepare FORCE
-       $(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
+       $(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1

 # FIXME Should go into a make.lib or something
 # ===========================================================================



>
>  scripts/Makefile.build | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 37a1d2cd49d4..4a26c7ed9198 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -52,6 +52,13 @@ ifndef obj
>  $(warning kbuild: Makefile.build is included improperly)
>  endif
>
> +ifeq ($(need-modorder),)
> +ifneq ($(obj-m),)
> +$(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
> +$(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
> +endif
> +endif
> +
>  # ===========================================================================
>
>  ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
