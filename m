Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32097 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbeI3USb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Sep 2018 16:18:31 -0400
MIME-Version: 1.0
References: <1536826841-4458-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1536826841-4458-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Sep 2018 22:44:36 +0900
Message-ID: <CAK7LNATVDHfS==P0r7tX6Q41HN3=4VfujZVdYOPsvXPR=Ers_Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unneeded link_multi_deps
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018=E5=B9=B49=E6=9C=8813=E6=97=A5(=E6=9C=A8) 17:22 Masahiro Yamada <yamada=
.masahiro@socionext.com>:
>
> Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
> appropriately"), $^ really represents all the prerequisite of the
> composite object being built.
>
> Hence, $(filter-out FORCE,$^) contains all the objects to link
> together, which is much simpler than link_multi_deps calculation.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/Makefile.build | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index cb03774..d7fa203 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -485,28 +485,12 @@ targets +=3D $(obj)/lib-ksyms.o
>
>  endif
>
> -#
> -# Rule to link composite objects
> -#
> -#  Composite objects are specified in kbuild makefile as follows:
> -#    <composite-object>-objs :=3D <list of .o files>
> -#  or
> -#    <composite-object>-y    :=3D <list of .o files>
> -#  or
> -#    <composite-object>-m    :=3D <list of .o files>
> -#  The -m syntax only works if <composite object> is a module
> -link_multi_deps =3D                     \
> -$(filter $(addprefix $(obj)/,         \
> -$($(subst $(obj)/,,$(@:.o=3D-objs)))    \
> -$($(subst $(obj)/,,$(@:.o=3D-y)))       \
> -$($(subst $(obj)/,,$(@:.o=3D-m)))), $^)
> -
>  quiet_cmd_link_multi-m =3D LD [M]  $@
> -cmd_link_multi-m =3D $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd=
_secanalysis)
> +cmd_link_multi-m =3D $(LD) $(ld_flags) -r -o $@ $(filter-out FORCE,$^) $=
(cmd_secanalysis)
>
>  $(multi-used-m): FORCE
>         $(call if_changed,link_multi-m)
> -       @{ echo $(@:.o=3D.ko); echo $(link_multi_deps); \
> +       @{ echo $(@:.o=3D.ko); echo $(filter-out FORCE,$^); \
>            $(cmd_undef_syms); } > $(MODVERDIR)/$(@F:.o=3D.mod)
>  $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
>
> --
> 2.7.4
>


--=20
Best Regards
Masahiro Yamada
