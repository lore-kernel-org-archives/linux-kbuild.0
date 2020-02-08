Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37415 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgBHFJz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Feb 2020 00:09:55 -0500
MIME-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com> <20200207180755.100561-4-qperret@google.com>
In-Reply-To: <20200207180755.100561-4-qperret@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2020 06:09:06 +0100
Message-ID: <CAK7LNAT+Xw8ntYcrcMtLrekkgziaHU+7nvzdh5tqD0cbe8pJhw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Maennich <maennich@google.com>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@infradead.org>

On Fri, Feb 7, 2020 at 7:08 PM Quentin Perret <qperret@google.com> wrote:
>
> When doing a cold build, autoksyms.h starts empty, and is updated late
> in the build process to have visibility over the symbols used by in-tree
> drivers. But since the symbol whitelist is known upfront, it can be used
> to pre-populate autoksyms.h and maximize the amount of code that can be
> compiled to its final state in a single pass, hence reducing build time.
>
> Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
> creating an empty file.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  Makefile                 | 2 +-
>  scripts/gen_autoksyms.sh | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6a01b073915e..e5c389d189f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1065,7 +1065,7 @@ autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
>
>  $(autoksyms_h):
>         $(Q)mkdir -p $(dir $@)
> -       $(Q)touch $@
> +       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@


Now that this line is doing a non-trivial task,
it might be a good idea to show a short log, like this:

  GEN     include/generated/autoksyms.h



You can do it like this:


quiet_cmd_autoksyms_h = GEN     $@
      cmd_autoksyms_h = mkdir -p $(dir $@); $(BASH)
$(srctree)/scripts/gen_autoksyms.sh $@

$(autoksyms_h):
        $(call cmd,autoksyms_h)





>
>  ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index ce0919c3791a..ae033ab03a4a 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -32,7 +32,8 @@ cat > "$output_file" << EOT
>
>  EOT
>
> -sed 's/ko$/mod/' modules.order |
> +[[ -f modules.order ]] && modlist=modules.order || modlist=/dev/null
> +sed 's/ko$/mod/' $modlist |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>  cat - "$ksym_wl" |
>  sort -u |
> --
> 2.25.0.341.g760bfbb309-goog
>


--
Best Regards

Masahiro Yamada
