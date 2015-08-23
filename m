Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36284 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753356AbbHWXNz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 23 Aug 2015 19:13:55 -0400
Received: by oiev193 with SMTP id v193so70238881oie.3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2015 16:13:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKv2aOEM-U7JNZnaHomA6HFBSFhSLZ-zhp7c20s6gQBaQ@mail.gmail.com>
References: <1438618000-1091-1-git-send-email-ian.campbell@citrix.com>
	<1439287646.9747.212.camel@citrix.com>
	<CAL_JsqKv2aOEM-U7JNZnaHomA6HFBSFhSLZ-zhp7c20s6gQBaQ@mail.gmail.com>
Date: Sun, 23 Aug 2015 16:13:54 -0700
Message-ID: <CAOesGMj46mvbdya1OQnZzL8VrxVwxAV3KoZZRtk3c0CTVx7d5w@mail.gmail.com>
Subject: Re: [PATCH v5] dtb: Create a common home for cross-architecture dtsi files.
From: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Ian Campbell <ian.campbell@citrix.com>, "arm@kernel.org" <arm@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Aug 14, 2015 at 2:21 PM, Rob Herring <robherring2@gmail.com> wrote:
> +arm-soc
>
> On Tue, Aug 11, 2015 at 5:07 AM, Ian Campbell <ian.campbell@citrix.com> wrote:
>> On Mon, 2015-08-03 at 17:06 +0100, Ian Campbell wrote:
>>> Commit 9ccd608070b6 ("arm64: dts: add device tree for ARM SMM-A53x2 on
>>> LogicTile Express 20MG") added a new dts file to arch/arm64 which
>>> included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
>>> .dtsi supplied by arch/arm.
>>>
>>> Unfortunately this causes some issues for the split device tree
>>> repository[0], since things get moved around there. In that context
>>> the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
>>> while the include is at src/arm/vexpress-v2m-rs1.dtsi.
>>
>> Hi Grant,
>>
>> Do you think there is any chance of getting this into 4.2-rc$NEXT or shall
>> we wait until 4.3? I'm assuming this should go via the DT tree, but maybe
>> it should go via an ARM tree?
>
> I was assuming this would go thru the arm-soc tree which is why I
> acked it. It is getting a bit late for 4.2 at this point, but I guess
> the standalone tree remains broken for these platforms until this is
> done. Probably not such a big deal in grand scheme of things.

I'm cc:d in the far tail of a thread, so I'll just comment here
instead of further up:

I'm not a fan at all of creating kernel/dts/<arch>/*, at least if
there's expected to be contents in there.

We don't have include/linux/asm-<arch>/ in the common tree either.
Let's not create that for dts.

So, while I'm all for a prefix-based sharing of DTSI files, I don't
want them to go in a common kernel/dts directory.

Besides sharing some snippets between arm and arm64, what else is
expected to need to go into such a shared location today?


-Olof
