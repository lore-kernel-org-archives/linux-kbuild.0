Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39047 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754218AbcBIXhG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Feb 2016 18:37:06 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 6/6] kconfig option for TRIM_UNUSED_EXPSYMS
In-Reply-To: <alpine.LFD.2.20.1602091158360.17825@knanqh.ubzr>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org> <1454963315-20468-7-git-send-email-nicolas.pitre@linaro.org> <20160209132840.GA7303@infradead.org> <alpine.LFD.2.20.1602091158360.17825@knanqh.ubzr>
Date: Wed, 10 Feb 2016 10:00:25 +1030
Message-ID: <87twlhzcku.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Christoph Hellwig <hch@infradead.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>

Nicolas Pitre <nicolas.pitre@linaro.org> writes:
> On Tue, 9 Feb 2016, Christoph Hellwig wrote:
>
>> On Mon, Feb 08, 2016 at 03:28:35PM -0500, Nicolas Pitre wrote:
>> > The config option to enable it all.
>> 
>> Just enable it by default..
>
> :-)
>
> Viro took the opposite view with this patch:
>
> http://lkml.org/lkml/2016/2/3/1068
>
> where he's ensuring that no exports are dropped, even if obviously 
> they're not used (otherwise some complaints would have come about).  So 
> I'm not sure if having this turned on by default is a good thing.
>
> But I don't mind being convinced otherwise.

People do build out-of-tree modules.  Dropping support for that would
simplify our lives, but seems fairly controversial :)

Cheers,
Rusty.
