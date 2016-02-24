Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33762 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754388AbcBXBgr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2016 20:36:47 -0500
MIME-Version: 1.0
In-Reply-To: <1455230079-26931-1-git-send-email-robh@kernel.org>
References: <1455230079-26931-1-git-send-email-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 23 Feb 2016 19:36:24 -0600
Message-ID: <CAL_JsqJC1PAyaX-BSe+iMnaSpEcpGKbROqm2kQ+=_dbfSn9V9g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Allow using host dtc instead of kernel's copy
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Feb 11, 2016 at 4:34 PM, Rob Herring <robh@kernel.org> wrote:
> Development of dtc happens in its own upstream repository, but testing
> dtc changes against the kernel tree is useful. Change dtc to a variable
> that users can override.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: linux-kbuild@vger.kernel.org

Applied to DT tree.

> ---
>  scripts/Makefile.lib | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 79e8661..ceceb53 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -262,6 +262,7 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -n -f -9 > $@) || \
>
>  # DTC
>  # ---------------------------------------------------------------------------
> +DTC ?= $(objtree)/scripts/dtc/dtc
>
>  # Generate an assembly file to wrap the output of the device tree compiler
>  quiet_cmd_dt_S_dtb= DTB     $@
> @@ -284,7 +285,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>         $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> -       $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
> +       $(DTC) -O dtb -o $@ -b 0 \
>                 -i $(dir $<) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> --
> 2.5.0
>
