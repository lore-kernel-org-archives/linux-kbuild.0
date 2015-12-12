Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:33226 "EHLO
	mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLLTNE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Dec 2015 14:13:04 -0500
MIME-Version: 1.0
In-Reply-To: <20151210163329.GA18947@udknight>
References: <20151210163329.GA18947@udknight>
Date: Sat, 12 Dec 2015 14:13:03 -0500
Message-ID: <CAMzpN2jG+mKQdAxKnvTebQtF1J79pC+E4QxELLO_C2K6ZR8PzA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support make dir/file.i for *.S
From: Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>, mmarek@suse.com, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Dec 10, 2015 at 11:33 AM, Wang YanQing <udknight@gmail.com> wrote:
> This feature could reduce a little time to expand all
> the macros in *.S for reading.
>
> Signed-off-by: Wang YanQing <udknight@gmail.com>
> ---
>  Makefile               | 2 ++
>  scripts/Makefile.build | 6 ++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 7558c9c..d7e2060 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1552,6 +1552,8 @@ endif
>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>  %.s: %.S prepare scripts FORCE
>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> +%.i: %.S prepare scripts FORCE
> +       $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>  %.o: %.S prepare scripts FORCE
>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>  %.symtypes: %.c prepare scripts FORCE
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 2c47f9c..2a51d49 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -287,6 +287,12 @@ cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $<
>  $(obj)/%.s: $(src)/%.S FORCE
>         $(call if_changed_dep,as_s_S)
>
> +quiet_cmd_cc_i_S = CPP $(quiet_modtag) $@
> +cmd_cc_i_S       = $(CPP) $(a_flags)   -o $@ $<
> +
> +$(obj)/%.i: $(src)/%.S FORCE
> +       $(call if_changed_dep,cc_i_S)
> +
>  quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
>  cmd_as_o_S       = $(CC) $(a_flags) -c -o $@ $<

*.s (lower case) is the suffix used for preprocessed assembly files,
and there is already a rule for that.  *.i is for preprocessed C
files.

--
Brian Gerst
