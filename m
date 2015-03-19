Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:36534 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750776AbbCSUpC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Mar 2015 16:45:02 -0400
Message-ID: <550B3549.1030808@gmail.com>
Date: Thu, 19 Mar 2015 13:44:57 -0700
From: Frank Rowand <frowand.list@gmail.com>
Reply-To: frowand.list@gmail.com
MIME-Version: 1.0
Subject: Re: [patch 2/7] dt: dtb version: document chosen/dtb-info node binding
References: <550A42AC.8060104@gmail.com> <550A4382.4030209@gmail.com> <CAL_Jsq+sPkZtreQ0sp8KXpkUVpFy=Yh9dr249u8uyoa8yksjmg@mail.gmail.com> <20150319184139.GG8656@n2100.arm.linux.org.uk> <550B1D16.7000108@gmail.com> <20150319193225.GH8656@n2100.arm.linux.org.uk>
In-Reply-To: <20150319193225.GH8656@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Michal Marek <mmarek@suse.cz>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Leif Lindholm <leif.lindholm@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>

On 3/19/2015 12:32 PM, Russell King - ARM Linux wrote:
> On Thu, Mar 19, 2015 at 12:01:42PM -0700, Frank Rowand wrote:
>> On 3/19/2015 11:41 AM, Russell King - ARM Linux wrote:
>> What???  Why would we ever accept code that tested the dtb version
>> instead of the compatible strings and properties in device nodes?
>> The dtb version is a meaningless number just like the kernel version
>> number in /proc/version is a meaningless number.  It starts at 1 (and
>> can be reset to 1 anytime the person controlling the build environment
>> chooses to for any random reason).  The dtb version number only makes
>> sense in a local context to check which build of an object actually
>> got onto the target.
> 
> I think you need to learn a lesson here.  I rotfled at your "just like
> the kernel version number" comment, because we already have code in the
> kernel to map 3.x and 4.x kernels to a 2.60.x number because userspace
> breaks with 3.x and 4.x version numbers.

I am aware of that and totally agree that it is on point.

> 
> I'm quite sure that someone made the exact same argument about kernel
> version numbers that you're making above about versioning dtb stuff.
> 
> At the end of the day, if userspace starts abusing an API that we've
> provided in good faith, and we change something such as the version
> information which results in userspace breaking - even if userspace is
> doing something that's wrong according to how we've defined it, it's
> still our problem to fix.  No userspace regressions when upgrading.
> That's the rule.

And I totally agree with that.

> 
> Don't bother trying to argue against this - you can't.  We will not accept
> any argument (no matter how valid) which will result in userspace breaking
> upon an upgrade.

No argument.  But I am not arguing for that.

> 
> You must be *absolutely* *sure* that you want to export this information,
> and that you are absolutely happy with the consequences which would occur
> should userspace then start using this information in a way which you did
> not intend, which could very well block you from ever being able to change
> the version number from a prescribed "this version number makes userspace
> work" value.

I understand the concern you are expressing.  And I agree it is an issue to
be concerned about and not dismissed.  But I also think that the concern is
mis-characterizing the "DTB version".  To pick on the example in patch 0,
an analogous Linux version is "#5" (not "4.0.0"):

   Linux version 4.0.0-rc4-dirty (frank@buildhost) (gcc version 4.6.x-google 20120106 (prerelease) (GCC) ) #5 SMP PREEMPT Wed Mar 18 20:04:48 PDT 2015

and the proposed DTB version is "#4":

   DTB version 4.0.0-rc4-dirty (frank@buildhost) (DTC 1.4.0-dirty) #4 Wed Mar 18 20:04:11 PDT 2015

I don't think the concern holds for "#5" and "#4".

I will concede that there is something unique in the proposed DTB version -
the source code system commit version number (in this example "4.0.0-rc4-dirty"
from git).
