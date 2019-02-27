Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:41386 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbfB0Lzs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Feb 2019 06:55:48 -0500
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 5/5] scripts/gdb: refactor rules for symlink creation
References: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
 <1550568787-18710-5-git-send-email-yamada.masahiro@socionext.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <acfea6b8-0986-3fc2-86a6-2553c9ef11e0@ideasonboard.com>
Date: Wed, 27 Feb 2019 11:55:42 +0000
MIME-Version: 1.0
In-Reply-To: <1550568787-18710-5-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, linux-kernel@vger.kernel.org

Hi Yamada-san,

On 19/02/2019 09:33, Masahiro Yamada wrote:
> gdb-scripts is not a real object, but (ab)used like a phony target.
> 
> Rewrite the code in a more Kbuild-ish way. Add symlinks to extra-y
> and use if_changed.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/gdb/linux/Makefile | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
> index 7545806..3df395a 100644
> --- a/scripts/gdb/linux/Makefile
> +++ b/scripts/gdb/linux/Makefile
> @@ -1,13 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> -always := gdb-scripts
>  
> -SRCTREE := $(abspath $(srctree))
> -
> -$(obj)/gdb-scripts:
>  ifneq ($(KBUILD_SRC),)
> -	$(Q)ln -fsn $(SRCTREE)/$(obj)/*.py $(objtree)/$(obj)
> +
> +symlinks := $(patsubst $(srctree)/$(src)/%,%,$(wildcard $(srctree)/$(src)/*.py))
> +
> +quiet_cmd_symlink = SYMLINK $@
> +      cmd_symlink = ln -fsn $(patsubst $(obj)/%,$(abspath $(srctree))/$(src)/%,$@) $@
> +
> +extra-y += $(symlinks)
> +$(addprefix $(obj)/, $(symlinks)): FORCE
> +	$(call if_changed,symlink)
> +
>  endif
> -	@:
>  
>  quiet_cmd_gen_constants_py = GEN     $@
>        cmd_gen_constants_py = \
> @@ -18,4 +22,4 @@ extra-y += constants.py
>  $(obj)/constants.py: $(src)/constants.py.in FORCE
>  	$(call if_changed_dep,gen_constants_py)
>  
> -clean-files := *.pyc *.pyo $(if $(KBUILD_SRC),*.py)
> +clean-files := *.pyc *.pyo

Perhaps this answers my earlier question.
I guess the extra-y hook is somehow handling the clean up of these files?

Aha - yes, I've just found it in

Documentation/kbuild/makefiles.txt:
> === 5 Kbuild clean infrastructure
> ...
> Kbuild knows targets listed in $(hostprogs-y), $(hostprogs-m), $(always), $(extra-y) and $(targets). They are all deleted during "make clean".

Perfect, so this is much better.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

-- 
Regards
--
Kieran
