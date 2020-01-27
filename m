Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:6723 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgA0KFp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jan 2020 05:05:45 -0500
Date: Mon, 27 Jan 2020 12:05:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] kbuild: Fix off-by-one error when generate a new
 version
Message-ID: <20200127100542.GV32742@smile.fi.intel.com>
References: <20200124195859.86991-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124195859.86991-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Jan 24, 2020 at 09:58:59PM +0200, Andy Shevchenko wrote:
> When build on, for example, x86 using `make O=... -j64` the version
> in the built kernel comes from include/generated/compile.h, which is:
> 
> 	#define UTS_VERSION "#351 SMP Fri Jan 24 18:46:34 EET 2020"
> 
> While at the end the x86 specific Makefile prints the contents of
> the .version file:
> 
> 	Kernel: arch/x86/boot/bzImage is ready  (#352)
> 
> Obviously the latter is not true. This happens because we first
> check compile.h and update it and then generate new version, which is
> incorrect flow:
> 
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   ...
>   GEN     .version
> 
> In order to fix this, move the version generation from link-vmlinux.sh
> to scripts/version.sh and re-use it in init/Makefile.
> 
> Additionally provide a unified way to get the current version of the build
> and use this in few callers. This will respect the KBUILD_BUILD_VERSION
> in case it's provided.

Hmm... It looks like a mess in my build tree.
I have to setup more experiments here.

-- 
With Best Regards,
Andy Shevchenko
