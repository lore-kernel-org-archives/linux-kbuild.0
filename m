Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37956 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751460AbdHPAOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Aug 2017 20:14:51 -0400
Subject: Re: [PATCH] devicetree: Enable generation of __symbols__ in all dtb
 files
References: <1502831736-28282-1-git-send-email-trini@konsulko.com>
 <CABGGiswpz6k4rnXk-3SLpwD5V8+zah-yaaB+yrrLofKY1eBx2w@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <59938E76.3010807@gmail.com>
Date: Tue, 15 Aug 2017 17:14:46 -0700
MIME-Version: 1.0
In-Reply-To: <CABGGiswpz6k4rnXk-3SLpwD5V8+zah-yaaB+yrrLofKY1eBx2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>, Tom Rini <trini@konsulko.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On 08/15/17 15:36, Rob Herring wrote:
> On Tue, Aug 15, 2017 at 4:15 PM, Tom Rini <trini@konsulko.com> wrote:
>> With support for stacked overlays being part of libfdt it is now

< snip >

>> My proposal is that we do not want __symbols__ existence to be dependent
>> on some part of the kernel configuration for a number of reasons.
>> First, this is out of step with the rest of how dtbs are created today
>> and more importantly, thought about.  Today, all dtb content is
>> independent of CONFIG options.  If you build a dtb from a given kernel
>> tree, everyone will agree on the result.  This is part of the "contract"
>> on passing old kernels and new dtb files even.
> 
> Agree completely. I don't even like that building dtbs depends on the ARCH.

< snip >

I also agree that use of CONFIG options is a solution that I do not like.
It has always seemed that there is a bit of an impedence mismatch in that
we build a dtb in an environment that is configured for a specific board
and architecture.

Does anyone have any thoughts on another way to control whether or not a
given dtb or a given build of a dtb would contain the symbols needed for
overlays or not include the symbols?

-Frank
