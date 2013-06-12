Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:42510 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752166Ab3FLLvM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 12 Jun 2013 07:51:12 -0400
Received: by mail-wg0-f54.google.com with SMTP id n11so420273wgh.21
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jun 2013 04:51:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130612112009.GA7422@linux-mips.org>
References: <1370944336-13703-1-git-send-email-markos.chandras@imgtec.com>
 <20130611154129.GD13126@linux-mips.org> <20130612112009.GA7422@linux-mips.org>
From: Markos Chandras <hwoarang@gentoo.org>
Date: Wed, 12 Jun 2013 12:50:31 +0100
Message-ID: <CAG2jQ8i5Sp1qp+6X+PkSugQXUtADm5xPCf4+V5f6=H1A=2NBVQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Kconfig: Set default value for the "Kernel code model"
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On 12 June 2013 12:20, Ralf Baechle <ralf@linux-mips.org> wrote:
> Here's a simplified test case:
>
> < --------- bite here --------- >
> choice
>         prompt "choice 1"
>
> config FOO1
>         bool "foo 1"
>
> config FOO2
>         bool "foo 2"
> endchoice
>
> choice
>         prompt "frob"
>
> config BAR
>         bool "bar"
>         depends on FOO2
>
> endchoice
> < --------- bite here --------- >
>
> Save this to a file, then run:
>
>   scripts/kconfig/conf --randconfig /tmp/xxx && cat .config
>
> There will be two possible variants for generated .config files:
>
> < --------- Variant 1 --------- >
> CONFIG_FOO1=y
> # CONFIG_FOO2 is not set
> < --------- Variant 2 --------- >
> # CONFIG_FOO1 is not set
> # CONFIG_FOO2 is not set
> < --------- End       --------- >
>
> The intended third outcome which would be
> < --------- doesn't happen ---- >
> # CONFIG_FOO1 is not set
> CONFIG_FOO2=y
> < --------- End --------------- >
>
> never gets generated.
>
> Pretty much any tempering with this test case will change the behaviour.
> For example removing the "depends on FOO2" line will result in the
> behaviour of either CONFIG_FOO1 or CONFIG_FOO2 being set to y but never
> none or both.  Other minor changes might result in both symbols getting
> set.
>
>   Ralf
>

Thanks for the testcase Ralf. My understanding is that if the 'choice'
symbol is available (meaning, all the dependencies are satisfied),
then one of the possible choices should always be selected. So
variant2 in the previous example seems wrong behavior to me.

--
Regards,
Markos Chandras - Gentoo Linux Developer
http://dev.gentoo.org/~hwoarang
