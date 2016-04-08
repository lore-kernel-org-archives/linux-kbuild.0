Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58972 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932725AbcDHPBC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Apr 2016 11:01:02 -0400
Date: Fri, 8 Apr 2016 12:00:57 -0300
From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH 1/2] kbuild: rename cmd_cc_i_c to cmd_cpp_i_c
Message-ID: <20160408150057.GF5327@redhat.com>
References: <1460082288-31817-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460082288-31817-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Aaro Koskinen <aaro.koskinen@nokia.com>, Adrian Hunter <adrian.hunter@intel.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Lukas Wunner <lukas@wunner.de>, Jiri Olsa <jolsa@kernel.org>

Em Fri, Apr 08, 2016 at 11:24:47AM +0900, Masahiro Yamada escreveu:
> This command just preprocesses .c files into .i files, so cmd_cpp_i_c
> seems more suitable.

Thanks for doing it to the tools/build/ copy, looks sensible, I guess
this can go via the kbuild tree?

Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>

- Arnaldo
 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/Makefile.build     | 6 +++---
>  tools/build/Makefile.build | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index e1bc190..7e4df13 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -152,11 +152,11 @@ cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
>  $(obj)/%.s: $(src)/%.c FORCE
>  	$(call if_changed_dep,cc_s_c)
>  
> -quiet_cmd_cc_i_c = CPP $(quiet_modtag) $@
> -cmd_cc_i_c       = $(CPP) $(c_flags)   -o $@ $<
> +quiet_cmd_cpp_i_c = CPP $(quiet_modtag) $@
> +cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
>  
>  $(obj)/%.i: $(src)/%.c FORCE
> -	$(call if_changed_dep,cc_i_c)
> +	$(call if_changed_dep,cpp_i_c)
>  
>  cmd_gensymtypes =                                                           \
>      $(CPP) -D__GENKSYMS__ $(c_flags) $< |                                   \
> diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
> index ee566e8..27f3583 100644
> --- a/tools/build/Makefile.build
> +++ b/tools/build/Makefile.build
> @@ -58,8 +58,8 @@ quiet_cmd_mkdir = MKDIR    $(dir $@)
>  quiet_cmd_cc_o_c = CC       $@
>        cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
>  
> -quiet_cmd_cc_i_c = CPP      $@
> -      cmd_cc_i_c = $(CC) $(c_flags) -E -o $@ $<
> +quiet_cmd_cpp_i_c = CPP      $@
> +      cmd_cpp_i_c = $(CC) $(c_flags) -E -o $@ $<
>  
>  quiet_cmd_cc_s_c = AS       $@
>        cmd_cc_s_c = $(CC) $(c_flags) -S -o $@ $<
> @@ -83,11 +83,11 @@ $(OUTPUT)%.o: %.S FORCE
>  
>  $(OUTPUT)%.i: %.c FORCE
>  	$(call rule_mkdir)
> -	$(call if_changed_dep,cc_i_c)
> +	$(call if_changed_dep,cpp_i_c)
>  
>  $(OUTPUT)%.s: %.S FORCE
>  	$(call rule_mkdir)
> -	$(call if_changed_dep,cc_i_c)
> +	$(call if_changed_dep,cpp_i_c)
>  
>  $(OUTPUT)%.s: %.c FORCE
>  	$(call rule_mkdir)
> -- 
> 1.9.1
