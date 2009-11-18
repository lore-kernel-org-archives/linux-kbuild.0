Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f171.google.com ([209.85.222.171]:61427 "EHLO
	mail-pz0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754258AbZKRKwo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2009 05:52:44 -0500
MIME-Version: 1.0
In-Reply-To: <4B03CA6E.8080102@suse.cz>
References: <b9df5fa10911180212h5d74e640g859e7cebe952689@mail.gmail.com>
	 <4B03CA6E.8080102@suse.cz>
Date: Wed, 18 Nov 2009 16:52:48 +0600
Message-ID: <b9df5fa10911180252l577deb1bm6d8aab76b912aad5@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add missing prototype
From: Rakib Mullick <rakib.mullick@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On 11/18/09, Michal Marek <mmarek@suse.cz> wrote:
>
> Hi Rakib,
>
>  thanks for the fix, but I already posted a new, simplified version that
>  doesn't use the fprintf2() thing at all:
>  http://patchwork.kernel.org/patch/50131/
>
Hi Michal,

Sorry I couldn't pick that up. Maybe it's not in the current -mm tree.
Isn't it? Does your simplified version removes the use of fprintf2()?

Thanks,
Rakib
>
>  Michal
>
>
>
>  >  When building defconfig on i386 - we were hit by the following warning:
>  >
>  >   HOSTCC  scripts/kconfig/zconf.tab.o
>  > In file included from scripts/kconfig/zconf.tab.c:2451:
>  > scripts/kconfig/confdata.c:676: warning: no previous prototype for 'fprintf2'
>  >
>  > Signed-off-by: Rakib Mullick <rakib.mullick@gmail.com>
>  > ---
>  >
>  > --- linus/scripts/kconfig/lkc.h       2009-11-18 16:37:46.000000000 +0600
>  > +++ rakib/scripts/kconfig/lkc.h       2009-11-18 17:03:19.000000000 +0600
>  > @@ -79,6 +79,7 @@ char *conf_get_default_confname(void);
>  >  void sym_set_change_count(int count);
>  >  void sym_add_change_count(int count);
>  >  void conf_set_all_new_symbols(enum conf_def_mode mode);
>  > +int fprintf2(FILE *f1, FILE *f2, const char *fmt, ...);
>  >
>  >  /* kconfig_load.c */
>  >  void kconfig_load(void);
>
>
