Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:50860 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751453AbcKHNnO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Nov 2016 08:43:14 -0500
Date: Tue, 8 Nov 2016 14:42:58 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: -fno-PIE, take #3
Message-ID: <20161108134258.u24zjqydcovn5npy@pd.tnic>
References: <20161104183940.30692-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161104183940.30692-1-bigeasy@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>

On Fri, Nov 04, 2016 at 07:39:37PM +0100, Sebastian Andrzej Siewior wrote:
> Debian gcc's is nowdays compiled with --enable-default-pie which means it does

Ho humm, there it is:

$ gcc -### /usr/include/stdlib.h 2>&1 | grep -o -- "--enable-default-pie"
--enable-default-pie

For all three:

Tested-by: Borislav Petkov <bp@suse.de>

That is, if that "fun" of building gcc with it doesn't get undone...

Thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
