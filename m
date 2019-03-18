Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42552 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbfCRTUk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 15:20:40 -0400
Date: Mon, 18 Mar 2019 15:20:37 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v2 5/8] modpost: Integrate klp-convert
Message-ID: <20190318192037.GA23186@redhat.com>
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190301141313.15057-6-jmoreira@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301141313.15057-6-jmoreira@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On Fri, Mar 01, 2019 at 11:13:10AM -0300, Joao Moreira wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> 
> Create cmd_klp_convert and hook it into scripts/Makefile.modpost.
> cmd_klp_convert invokes klp-convert with the right arguments for the
> conversion of unresolved symbols inside a livepatch.
> 
> [khlebnikov:
> * save cmd_ld_ko_o into .module.cmd, if_changed_rule doesn't do that
> * fix bashisms for debian where /bin/sh is a symlink to /bin/dash
> * rename rule_link_module to rule_ld_ko_o, otherwise arg-check inside
>   if_changed_rule compares cmd_link_module and cmd_ld_ko_o
> * check modinfo -F livepatch only if CONFIG_LIVEPATCH is true
> ]
> 
> [mbenes:
> * remove modinfo call. LIVEPATCH_ in Makefiled
> ]
> 
> [jmoreira:
> * split up: move the .livepatch file-based scheme for identifying
> livepatches to a previous patch, as it was required for correctly
> building Symbols.list there.
> ]
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> ---
>  scripts/Kbuild.include   |  4 +++-
>  scripts/Makefile.modpost | 16 +++++++++++++++-
>  scripts/mod/modpost.c    |  6 +++++-
>  scripts/mod/modpost.h    |  1 +
>  4 files changed, 24 insertions(+), 3 deletions(-)
> 
> [ ... snip ... ]
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 7d4af0d0accb..da779a185218 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -125,8 +125,22 @@ quiet_cmd_ld_ko_o = LD [M]  $@
>                   -o $@ $(filter-out FORCE,$^) ;                         \
>  	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>  
> +SLIST = $(objtree)/Symbols.list
> +KLP_CONVERT = scripts/livepatch/klp-convert
> +quiet_cmd_klp_convert = KLP $@

Minor nit, but a little more whitespace after "KLP" will more neatly
align the build output:

  [squash] modpost: align KLP prefix 
  https://github.com/torvalds/linux/commit/543aa6bc390b778a2e5a6706960c1414404d409e

> [ ... snip ... ]
>  
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 26bf886bd168..1dfc34d8b668 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1979,6 +1979,10 @@ static void read_symbols(const char *modname)
>  		license = get_next_modinfo(&info, "license", license);
>  	}
>  
> +	/* Livepatch modules have unresolved symbols resolved by klp-convert */
> +	if (get_modinfo(info.modinfo, info.modinfo_len, "livepatch"))
> +		mod->livepatch = 1;
> +
> [ ... snip ... ]

To bisect/build post v5.0 merge, I needed to update the get_modinfo()
call.  h/t to the 0-day bot for flagging this:
  
  [squash] modpost: rebase for v5.0 
  https://github.com/torvalds/linux/commit/ab82f725dbc8d6366ca4912a4d05372e24e92e8b

-- Joe
