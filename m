Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41924 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbeKOTTS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 14:19:18 -0500
Received: by mail-ed1-f66.google.com with SMTP id 14so6894416eds.8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Nov 2018 01:12:21 -0800 (PST)
Subject: Re: [PATCH 5/8] kbuild: change if_changed_rule to accept multi-line
 recipe
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
 <1542270435-11181-6-git-send-email-yamada.masahiro@socionext.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <6ee62b52-5d6d-c540-5f01-f522b6986c4d@rasmusvillemoes.dk>
Date: Thu, 15 Nov 2018 10:12:18 +0100
MIME-Version: 1.0
In-Reply-To: <1542270435-11181-6-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On 15/11/2018 09.27, Masahiro Yamada wrote:
> GNU Make supports 'define' ... 'endef' directive, which can describe
> a recipe that consists of multiple lines.
> 
>   endef
> 
> This does not actually exploit the benefits of 'define' ... 'endef'
> form. All shell commands must be concatenated with '; \' so that it
> looks like a single command from the Makefile point of view. '@' can
> only appear before the first action.
> 
> The root cause of this misfortune is the '@set -e;' in if_changed_rule.
> It is easily solvable by moving '@set -e' to the 'cmd' macro.
> 
> The combo of $(call echo-cmd,*) $(cmd_*) in rule_cc_o_c and rule_as_o_S
> were replaced with $(call cmd,*). The tailing back-slashes went away.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>  
>  define rule_cc_o_c
> -	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
> -	$(call cmd_and_fixdep,cc_o_c)					  \
> -	$(cmd_gen_ksymdeps)						  \
> -	$(cmd_checkdoc)							  \
> -	$(call echo-cmd,objtool) $(cmd_objtool)				  \
> -	$(cmd_modversions_c)						  \
> -	$(call echo-cmd,record_mcount) $(cmd_record_mcount)
> +	$(call cmd,checksrc)
> +	@$(call cmd_and_fixdep,cc_o_c)
> +	$(call cmd,gen_ksymdeps)
> +	$(call cmd,checkdoc)
> +	$(call cmd,objtool)
> +	$(call cmd,modversions_c)
> +	$(call cmd,record_mcount)
>  endef

Does this mean that Make now spawns a new shell for each of these
commands, and if so, what's the performance impact? Or am I just
misreading things? If this does change the semantics (one shell instance
versus many), I think that's worth mentioning explicitly in the
changelog, regardless of whether there's no measuarable performance impact.

Rasmus
