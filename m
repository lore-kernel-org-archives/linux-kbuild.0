Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:33305 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932790AbbELOdf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 May 2015 10:33:35 -0400
Subject: Re: [PATCH/RFC] kbuild: Create a rule for building device tree overlay objects
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
From: Pantelis Antoniou <pantelis.antoniou@gmail.com>
In-Reply-To: <1431431816-24612-1-git-send-email-geert+renesas@glider.be>
Date: Tue, 12 May 2015 17:33:29 +0300
Content-Transfer-Encoding: 8BIT
Message-Id: <D4386733-8722-478F-8BB6-FB86597D9E37@gmail.com>
References: <1431431816-24612-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Geert,

> On May 12, 2015, at 14:56 , Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> This allows to handle device tree overlays like plain device trees.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Questions:
>  - Do we want dtso files under arch/<arch>/boot/dts/, too?
>  - Do we want to move the dts files outside the kernel repository
>    first?
> 

Oh that’s a nice hornet’s nest you’ve kicked here.

arch/<arch>/boot/dts should not be the place, cause overlays are not related with boot per se.
As they are right now are board (family) specific.

I think we should try to keep an external kernel repo with them for now until we
figure out where to put them.

> scripts/Makefile.lib | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 79e86613712f2230..4b14eef1d4b2ce8f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -292,6 +292,9 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
> $(obj)/%.dtb: $(src)/%.dts FORCE
> 	$(call if_changed_dep,dtc)
> 
> +$(obj)/%.dtbo: $(src)/%.dtso FORCE
> +	$(call if_changed_dep,dtc)
> +
> dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
> 
> # Bzip2
> -- 
> 1.9.1

Regards

— Pantelis

