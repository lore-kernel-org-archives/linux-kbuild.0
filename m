Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61027 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgBZRsg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:48:36 -0500
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200222190435.11767-2-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 27 Feb 2020 02:47:36 +0900
Message-ID: <CAK7LNATMKS9vAOtKTncDYTN1kmx1iZN4LHBmP-XLPGBn9TmxaA@mail.gmail.com>
Subject: Re: [PATCH 2/5] kbuild: remove unneeded semicolon at the end of cmd_dtb_check
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Feb 23, 2020 at 4:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This trailing semicolon is unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied with Rob's Ack.


>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 64b938c10039..752ff0a225a9 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -300,7 +300,7 @@ DT_BINDING_DIR := Documentation/devicetree/bindings
>  DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
>
>  quiet_cmd_dtb_check =  CHECK   $@
> -      cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ ;
> +      cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
>
>  define rule_dtc
>         $(call cmd_and_fixdep,dtc,yaml)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
