Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.190]:3450 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752771AbYG3XX7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Jul 2008 19:23:59 -0400
Received: by nf-out-0910.google.com with SMTP id d3so145204nfc.21
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Jul 2008 16:23:56 -0700 (PDT)
Message-ID: <520f0cf10807301623l759baa8ub9c669176107fa85@mail.gmail.com>
Date: Thu, 31 Jul 2008 01:23:56 +0200
From: "John Kacur" <jkacur@gmail.com>
Subject: Re: [PATCH] Change Kbuild message to match default
In-Reply-To: <20080730202655.GA12148@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200807160031.16323.jkacur@gmail.com>
	 <520f0cf10807260234v64297490l6db807fee0864cc5@mail.gmail.com>
	 <20080730202655.GA12148@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jul 30, 2008 at 10:26 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Sat, Jul 26, 2008 at 11:34:14AM +0200, John Kacur wrote:
>> On Wed, Jul 16, 2008 at 12:31 AM, jkacur <jkacur@gmail.com> wrote:
>> > Change the Kbuild "If unsure" message to match the default.
>> >
>> > Signed-off-by: John Kacur <jkacur at gmail dot com>
>> >
>> > Index: linux-2.6.26/init/Kconfig
>> > ===================================================================
>> > --- linux-2.6.26.orig/init/Kconfig
>> > +++ linux-2.6.26/init/Kconfig
>> > @@ -522,7 +522,7 @@ config CC_OPTIMIZE_FOR_SIZE
>> >          Enabling this option will pass "-Os" instead of "-O2" to gcc
>> >          resulting in a smaller kernel.
>> >
>> > -         If unsure, say N.
>> > +         If unsure, say Y.
>> >
>> >  config SYSCTL
>> >        bool
>> >
>>
>> This seems like a no-brainer to me that the default and the "If
>> unsure" message should match, any reason you haven't picked-it up?
>
> Two reasons:
>
> 1) I have not started to look at new patches until now
>
>   And this is due to several reasons.
>   First off I have been without internet for a while.
>   And secondly I do try to avoid new patches during the
>   merge window which does not fix merge issues.

Ok, no problem!

>
> 2) I am not convinced that "default y" is really what we want.
>   What does popular distroes use (aka what gets wide testing?).
>

Hmnn, good point, in any case there is an inconsistency here. I can
only speak for my laptop here running openSUSE 11.0 (X86-64)

gunzip -c /proc/config.gz | grep CC_OPTIMIZE_FOR_SIZE
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
uname -a
Linux linux-ipxk 2.6.25.11-0.1-default #1 SMP 2008-07-13 20:48:28
+0200 x86_64 x86_64 x86_64 GNU/Linux
