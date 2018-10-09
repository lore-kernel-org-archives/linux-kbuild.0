Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48975 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbeJIWRg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Oct 2018 18:17:36 -0400
MIME-Version: 1.0
References: <1538627119-11346-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538627119-11346-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Oct 2018 23:59:22 +0900
Message-ID: <CAK7LNATOf8cp=A+VeDBi=Wn-3DBAnd78Uxc5OL_b-MOkc6dJcw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: remove unneeded link_multi_deps
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Oct 4, 2018 at 1:25 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
> appropriately"), $^ really represents all the prerequisite of the
> composite object being built.
>
> Hence, $(filter %.o,$^) contains all the objects to link together,
> which is much simpler than link_multi_deps calculation.
>
> Please note $(filter-out FORCE,$^) does not work here.  When a
> single object module is turned into a multi object module, $^ will
> contain header files that were previously included for building the
> single object, and recorded in the .*.cmd file.  $(filter %.o,$^)
> should be used to filter out such headers.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Fix regression reported in linux-next.
>     https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1779047.html


V2 replaced V1.


>  scripts/Makefile.build | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index cb03774..f21b48d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -485,28 +485,12 @@ targets += $(obj)/lib-ksyms.o
>
>  endif
>
> -#
> -# Rule to link composite objects
> -#
> -#  Composite objects are specified in kbuild makefile as follows:
> -#    <composite-object>-objs := <list of .o files>
> -#  or
> -#    <composite-object>-y    := <list of .o files>
> -#  or
> -#    <composite-object>-m    := <list of .o files>
> -#  The -m syntax only works if <composite object> is a module
> -link_multi_deps =                     \
> -$(filter $(addprefix $(obj)/,         \
> -$($(subst $(obj)/,,$(@:.o=-objs)))    \
> -$($(subst $(obj)/,,$(@:.o=-y)))       \
> -$($(subst $(obj)/,,$(@:.o=-m)))), $^)
> -
>  quiet_cmd_link_multi-m = LD [M]  $@
> -cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
> +cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^) $(cmd_secanalysis)
>
>  $(multi-used-m): FORCE
>         $(call if_changed,link_multi-m)
> -       @{ echo $(@:.o=.ko); echo $(link_multi_deps); \
> +       @{ echo $(@:.o=.ko); echo $(filter %.o,$^); \
>            $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=.mod)
>  $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
