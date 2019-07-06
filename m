Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:22881 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfGFOqi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:46:38 -0400
MIME-Version: 1.0
References: <20190622160705.17071-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190622160705.17071-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 6 Jul 2019 23:45:53 +0900
Message-ID: <CAK7LNAQsdbV5MD4nBiSwky9jQue8+tRGwAxkFwYwyV-b17cYMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: rename arg-check to cmd-check
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jun 23, 2019 at 1:07 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I prefer 'cmd-check' for consistency.
>
> We have 'echo-cmd', 'cmd', 'cmd_and_fixdep', etc. in this file.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>  scripts/Kbuild.include | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index f641bb0aa63f..4bec04c89750 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -213,12 +213,12 @@ objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
>  # See Documentation/kbuild/makefiles.txt for more info
>
>  ifneq ($(KBUILD_NOCMDDEP),1)
> -# Check if both arguments are the same including their order. Result is empty
> +# Check if both commands are the same including their order. Result is empty
>  # string if equal. User may override this check using make KBUILD_NOCMDDEP=1
> -arg-check = $(filter-out $(subst $(space),$(space_escape),$(strip $(cmd_$@))), \
> +cmd-check = $(filter-out $(subst $(space),$(space_escape),$(strip $(cmd_$@))), \
>                           $(subst $(space),$(space_escape),$(strip $(cmd_$1))))
>  else
> -arg-check = $(if $(strip $(cmd_$@)),,1)
> +cmd-check = $(if $(strip $(cmd_$@)),,1)
>  endif
>
>  # Replace >$< with >$$< to preserve $ when reloading the .cmd file
> @@ -234,12 +234,12 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
>  any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
>
>  # Execute command if command has changed or prerequisite(s) are updated.
> -if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
> +if_changed = $(if $(strip $(any-prereq) $(cmd-check)),                       \
>         $(cmd);                                                              \
>         printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
>
>  # Execute the command and also postprocess generated .d dependencies file.
> -if_changed_dep = $(if $(strip $(any-prereq) $(arg-check)),$(cmd_and_fixdep),@:)
> +if_changed_dep = $(if $(strip $(any-prereq) $(cmd-check)),$(cmd_and_fixdep),@:)
>
>  cmd_and_fixdep =                                                             \
>         $(cmd);                                                              \
> @@ -249,7 +249,7 @@ cmd_and_fixdep =                                                             \
>  # Usage: $(call if_changed_rule,foo)
>  # Will check if $(cmd_foo) or any of the prerequisites changed,
>  # and if so will execute $(rule_foo).
> -if_changed_rule = $(if $(strip $(any-prereq) $(arg-check)),$(rule_$(1)),@:)
> +if_changed_rule = $(if $(strip $(any-prereq) $(cmd-check)),$(rule_$(1)),@:)
>
>  ###
>  # why - tell why a target got built
> @@ -275,7 +275,7 @@ why =                                                                        \
>      $(if $(filter $@, $(PHONY)),- due to target is PHONY,                    \
>          $(if $(wildcard $@),                                                 \
>              $(if $(strip $(any-prereq)),- due to: $(any-prereq),             \
> -                $(if $(arg-check),                                           \
> +                $(if $(cmd-check),                                           \
>                      $(if $(cmd_$@),- due to command line change,             \
>                          $(if $(filter $@, $(targets)),                       \
>                              - due to missing .cmd file,                      \
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
