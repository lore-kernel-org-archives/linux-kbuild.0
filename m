Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:50631 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgBVQuu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 11:50:50 -0500
MIME-Version: 1.0
References: <20200221222955.21038-1-robh@kernel.org> <20200221222955.21038-2-robh@kernel.org>
In-Reply-To: <20200221222955.21038-2-robh@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 23 Feb 2020 01:50:09 +0900
Message-ID: <CAK7LNATo6b178Zfj3gOdnicFfP6s5-yNwbPg+CAd4YcKHYdFqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Build DT binding examples with dtc warnings enabled
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Rob,

On Sat, Feb 22, 2020 at 7:29 AM Rob Herring <robh@kernel.org> wrote:
>
> Now that we have a separate rule for DT binding examples, we can customize
> the dtc options. Let's adjust the dtc warnings to me more strict by
> default so the examples get cleaned up as they get converted to schema.
>
> Leaving 'avoid_unnecessary_addr_size' and 'graph_child_address' warnings
> disabled as examples tend to be incomplete and they generates a lot of
> warnings.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  scripts/Makefile.lib | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 78fa1a3d983a..1a149e680308 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -308,6 +308,10 @@ define rule_dtc_dt_yaml
>         $(call cmd,dtb_check,$(word 2, $(real-prereqs)))
>  endef
>
> +$(obj)/%.example.dt.yaml: DTC_FLAGS = \
> +       -Wno-avoid_unnecessary_addr_size \
> +       -Wno-graph_child_address
> +



This does not work since I suggested to
not add this pattern rule in 1/2.


Instead, you can override DTC_FLAGS
from Documentation/devicetree/bindings/Makefile

So, alternative solution is like follows
(on top of my suggestion in 1/2)



diff --git a/Documentation/devicetree/bindings/Makefile
b/Documentation/devicetree/bindings/Makefile
index 7c40d5ba1b51..e44c972849e6 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -12,6 +12,8 @@ $(obj)/%.example.dts: $(src)/%.yaml FORCE

 # Use full schemas when checking %.example.dts
 DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
+# More strict checks for examples
+override DTC_FLAGS := -Wno-avoid_unnecessary_addr_size -Wno-graph_child_address

 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
$(real-prereqs)





One limitation for this way is that
you cannot use W=1, W=2, W=3 for example DT.



>  $(obj)/%.example.dt.yaml: $(src)/%.example.dts $(DT_EXAMPLES_SCHEMA) $(DTC) FORCE
>         $(call if_changed_rule,dtc_dt_yaml)





-- 
Best Regards
Masahiro Yamada
