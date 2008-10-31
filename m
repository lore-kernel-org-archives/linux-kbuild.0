Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from orion2.pixelized.ch ([195.190.190.13]:37387 "EHLO
	orion.pixelized.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbYJaMeW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Oct 2008 08:34:22 -0400
Message-ID: <490AFB43.30504@cateee.net>
Date: Fri, 31 Oct 2008 13:34:11 +0100
From: "Giacomo A. Catenazzi" <cate@cateee.net>
MIME-Version: 1.0
Subject: Re: [PATCH] conf.c: use return to exit from main()
References: <20081031110905.GA20416@michl.2n.cz>
In-Reply-To: <20081031110905.GA20416@michl.2n.cz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-kbuild@vger.kernel.org

Ladislav Michl wrote:
> Replace exit() with return and use standard exit values. Good for
> code size and readability, although I have to admit both has very
> little impact on real world... :-)
> 
>    text    data     bss     dec     hex filename
>   60608    2084    5908   68600   10bf8 scripts/kconfig/conf_orig
>   60528    2084    5908   68520   10ba8 scripts/kconfig/conf

replacing return is ok, but it is wrong to change the return values:

We are on POSIX (UNIX, Linux, etc), not on a very generic standard C
implementation.  The return value is important and it could be
used by other scripts, which is not guarantee in generic standard C.

With your change, it is more difficult to add other errors and to test
error values, because AFAIK the EXIT_FAILURE is not fix.

For these two reason, and because I don't think this program
could be ported in a generic C platform, I think you should
not uset EXIT_FAILURE.

ciao
	cate

