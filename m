Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33186 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752519AbaHTP6P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Aug 2014 11:58:15 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 2/3] kbuild: handle module compression while running 'make modules_install'.
In-Reply-To: <20140819234912.GL4120@two.firstfloor.org>
References: <1408215016-1848-1-git-send-email-beber@meleeweb.net> <1408215016-1848-3-git-send-email-beber@meleeweb.net> <87lhqkmxdl.fsf@tassilo.jf.intel.com> <20140819152238.GB2164@lady-voodoo.exosec.local> <20140819234912.GL4120@two.firstfloor.org>
Date: Thu, 21 Aug 2014 00:34:13 +0930
Message-ID: <8738crjj82.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, Bertrand Jacquin <beber@meleeweb.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>

Andi Kleen <andi@firstfloor.org> writes:
>> I understand your concern about this, but does is make sense to not use
>> -9 when then following files use gzip or other compression tools with -9 :
>
> Just because someone else makes mistakes doesn't mean that you should
> make them too.

To be fair, you didn't provide hard numbers: *I* was surprised by the
results when I tested it.

Cheers,
Rusty.
