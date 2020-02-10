Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33928 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgBJUXR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 15:23:17 -0500
MIME-Version: 1.0
References: <20200124195859.86991-1-andriy.shevchenko@linux.intel.com>
 <20200127100542.GV32742@smile.fi.intel.com> <CAK7LNAQkKOheXLVq+sjjmBMzREBZYN8XkxzcVmkkVpN4OjjRGQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQkKOheXLVq+sjjmBMzREBZYN8XkxzcVmkkVpN4OjjRGQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Feb 2020 22:23:04 +0200
Message-ID: <CAHp75VcWamYQGg8dWdgTWV5ShV_DT9bfcv0b+WKyPHK7PsVS5w@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Fix off-by-one error when generate a new version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Michal Simek <monstr@monstr.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Mon, Feb 10, 2020 at 10:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Mon, Jan 27, 2020 at 7:05 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Jan 24, 2020 at 09:58:59PM +0200, Andy Shevchenko wrote:

...

> > > Additionally provide a unified way to get the current version of the build
> > > and use this in few callers. This will respect the KBUILD_BUILD_VERSION
> > > in case it's provided.

I still think there is second part in my patch to be considered, i.e. see above.

...

> I remember I was also hit by this one month ago or so.
>
> I did not dig into it at that time
> because the problem disappeared after doing something.
>
> Today, I took a look at this again.
> This is a regression caused by 56d589361572
>
> This patch should fix it:
> https://patchwork.kernel.org/patch/11374047/

Thank you.

-- 
With Best Regards,
Andy Shevchenko
