Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:60840 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500Ab0AAOSm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Jan 2010 09:18:42 -0500
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH v2 2/3] powerpc: Add support for creating FIT uImages
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
In-reply-to: <fa686aa40912301457l704c324bk511a207d07218525@mail.gmail.com>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com> <1261446643-21714-3-git-send-email-ptyser@xes-inc.com> <fa686aa40912301457l704c324bk511a207d07218525@mail.gmail.com>
Date: Fri, 01 Jan 2010 15:18:40 +0100
Message-Id: <20100101141840.D6C273F6FF@gemini.denx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

Dear Grant,

In message <fa686aa40912301457l704c324bk511a207d07218525@mail.gmail.com> you wrote:
>
> Unfortunately, the wrapper script is also being used to do things that
> are completely unrelated to creating wrapper binaries.  FIT images
> (and uImages) don't use any of the wrapper bits at all.  In fact, as
> seen in this patch, generating them involves bailing out of the
> wrapper script early to avoid linking the wrapper bits.  I think for
> all types of uImages, the wrapper script is being misused and I don't
> like the extra complexity that it adds.

Agreed.

> Rather than adding new paths to arch/powerpc/boot/wrapper, I would
> rather see a new script used for generating FIT image that isn't
> complicated by all the current wrapper cruft.  Also, the Makefile rule
> doesn't need to depend on $(wrapperbits) which means faster build
> times when only building uImages.
> 
> Bonus points if you also convert the uImage target to use the new
> script; but I'm not demanding that you do that yet.

I think if this is handles in a separate script, the legacy uImage
support must be handled in this new script, too. Otherwise it would be
too difficult to understanmd the relation of the two image formats.

> Finally, you need to add documentation about the new target to
> Documentation/powerpc/bootwrapper.txt.

Let's keep in mind that the uImage formats (both the old legacy and
the new FIT format) are inherently architecture independent. We want
to use this same mechanism for example on ARM, and on other
architectures as well.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
How many Unix hacks does it take to change a light bulb?  Let's  see,
   can you use a shell script for that or does it need a C program?
