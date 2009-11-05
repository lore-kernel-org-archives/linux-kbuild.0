Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f202.google.com ([209.85.211.202]:64230 "EHLO
	mail-yw0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756073AbZKEQRm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Nov 2009 11:17:42 -0500
MIME-Version: 1.0
In-Reply-To: <4AF2E00A.3010107@tuffmail.co.uk>
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
	<1257242782-10496-6-git-send-email-alan-jenkins@tuffmail.co.uk>
	<200911041849.43311.rusty@rustcorp.com.au> <4AF150D2.6000207@tuffmail.co.uk>
	<20091104171916.GA6323@merkur.ravnborg.org> <4AF2E00A.3010107@tuffmail.co.uk>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 5 Nov 2009 11:17:27 -0500
Message-ID: <8bd0f97a0911050817u73d6d247p6cdbf3daf81ee73f@mail.gmail.com>
Subject: Re: [PATCH 05/10] kbuild: sort the list of symbols exported by the
	kernel (__ksymtab)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>, greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On Thu, Nov 5, 2009 at 09:24, Alan Jenkins wrote:
> Thanks to both of you, I have something that works now.
> Unfortunately I had to export the variable AFLAGS_.tmp_export-asm.o,
> otherwise it had no effect.  I assume it's a limitation of the top-level
> Makefile.
> To make SYMBOL_PREFIX available for linker scripts, I also added it to
> "cpp_flags" in scripts/Makefile.lib.  (As far as I can see, cpp_flags is
> _only_ used for preprocessing linker scripts).
>
> If this is all getting too brittle, I guess I could be less timid and add it
> to  the global KBUILD_CPPFLAGS instead :).

this stuff looks fine to me, thanks.  pushing the Blackfin stuff via
other trees as part of the set is OK in my book.
Acked-By: Mike Frysinger <vapier@gentoo.org>
-mike
