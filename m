Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:43307 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752130AbbDUHyN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Apr 2015 03:54:13 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH] tools/lib/api/Makefile: Add feature check for _FORTIFY_SOURCE
In-Reply-To: <CAArOQ2XqxqF8cLmxe5DWwcAEvJbMnqnvaoB5U3+DGqwBYWVqRQ@mail.gmail.com>
	(Bobby Powers's message of "Mon, 20 Apr 2015 14:55:59 -0400")
References: <ghlhhnf0j2.fsf@lena.gouders.net>
	<20150420181631.GA19378@gmail.com> <gh7ft6odi8.fsf@quad.gouders.net>
	<CAArOQ2XqxqF8cLmxe5DWwcAEvJbMnqnvaoB5U3+DGqwBYWVqRQ@mail.gmail.com>
Date: Tue, 21 Apr 2015 09:46:17 +0200
Message-ID: <ghh9s9hqk6.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bobby Powers <bobbypowers@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>

Bobby Powers <bobbypowers@gmail.com> writes:

> Hi,
>
> Dirk Gouders <dirk@gouders.net> wrote:
>> Yes, I was suggesting something similar (but without founded reasoning),
>> some time ago [1].
>
> I submitted a patch for this a few days ago, but I didn't realize I
> should CC linux-kbuild@ (my bad):
> https://lkml.org/lkml/2015/4/18/71

Thanks for the hint, Bobby, I really should have checked recent
archives.

I could not apply your patch against Linus' current tree, but tested it
with your change typed in, manually with positive result (as expected).

Dirk
