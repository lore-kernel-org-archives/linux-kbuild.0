Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33641 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757248AbbCSRXW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Mar 2015 13:23:22 -0400
MIME-Version: 1.0
In-Reply-To: <550B013B.1060002@gmail.com>
References: <550A42AC.8060104@gmail.com>
	<550A4382.4030209@gmail.com>
	<20150319134910.GF18473@leverpostej>
	<550B013B.1060002@gmail.com>
Date: Thu, 19 Mar 2015 18:23:21 +0100
Message-ID: <CAMuHMdV1O2dpEW2yA2OFJ71zBm1aHSoiREmn3ujP5kEGZCN1GA@mail.gmail.com>
Subject: Re: [patch 2/7] dt: dtb version: document chosen/dtb-info node binding
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.cz>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Leif Lindholm <leif.lindholm@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>

On Thu, Mar 19, 2015 at 6:02 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>> Why would you _ever_ need an absolute path!?
>
> The absolute path tells you which source repository contained the source.

Really? Usually it's just gonna be <something>/linux-2.6...

IMHO it leaks information (the <something>) you don't want to be in final
build, like login names and file server names.
We already have way to many uses of __FILE__ in the kernel source tree.
Unfortunately there's no replacement macro with just the relative path,
against the topdir of the source tree.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
