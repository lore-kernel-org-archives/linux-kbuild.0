Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42131 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755310Ab1HaMTG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 08:19:06 -0400
Message-ID: <4E5E26B8.5030606@suse.cz>
Date: Wed, 31 Aug 2011 14:19:04 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: protect locale-unsafe calls
References: <1313471973-13966-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1313471973-13966-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, s.koylux@gmail.com

On 16.8.2011 07:19, Arnaud Lacombe wrote:
> There is a few calls in kconfig where we end-up using tolower(3) or toupper(3)
> in an unsafe manner. As highlighted by Serdar, it would seem that Turkish's
> locale do not have representable lowercase for the Engligh capital-dotless-i.
> 
> Introduces locale-safe portion in the backend where we reset the local to the
> default "C".
> 
> Reported-by: Serdar KÖYLÜ <s.koylux@gmail.com>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/confdata.c |   10 ++++++++++

I think that just changing kconfig will make things even worse, because
fixdep does the same operation (CONFIG_FOO -> include/config/foo.h) and
would get out of sync with kconfig now. I guess the direct cause for
Serdar's build failure was this staging driver:
drivers/staging/cxt1e1/sbecom_inline_linux.h:

    53  #if defined(CONFIG_MODVERSIONS) && defined(MODULE) && !
defined(MODVERSIONS)
    54  #define MODVERSIONS
    55  #endif
    56
    57  #ifdef MODULE
    58  #ifdef MODVERSIONS
    59  #include <config/modversions.h>
                  ^^^^^^^^^^^^^^^^^^^^
    60  #endif
    61  #include <linux/module.h>
    62  #endif
    63  #endif

I'll send a patch cleaning this up once I verify that it really is the
cause.

As for the tollower/toupper issue, I would propose a much simpler way:
Let's not try to be cute and simply use include/config/FOO_BAR.h for
each CONFIG_FOO_BAR. x86_64 allmodconfig results in some 5k symbols
enabled, I'm sure any filesystem will handle a directory with 5k files
in it.

Michal
