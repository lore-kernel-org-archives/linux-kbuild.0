Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752882AbdGYUgw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jul 2017 16:36:52 -0400
MIME-Version: 1.0
In-Reply-To: <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com> <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 25 Jul 2017 15:36:29 -0500
Message-ID: <CAL_JsqKZ5JcunaY9K5MEjyS-sxargKtJq11x+DVMwHs8WrnH+Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, Michal Marek <mmarek@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Apr 25, 2017 at 7:09 PM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> Existing overlay unit tests examine individual pieces of the overlay
> code.  The new tests target the entire process of applying an overlay.
>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---

[...]

> @@ -1261,6 +1263,8 @@ void __init unflatten_device_tree(void)
>
>         /* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>         of_alias_scan(early_init_dt_alloc_memory_arch);
> +
> +       unittest_unflatten_overlay_base();

This breaks on systems that don't boot with FDT and call
unflatten_device_tree, namely x86 and UML (UML needs a few hacks to
work) which was a feature of the unittest. Considering applying
overlays on x86 is something we'll want to support, the unittest
should support that case.

Rob
