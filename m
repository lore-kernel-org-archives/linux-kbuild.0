Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:35660 "EHLO
	mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932689AbcBIREz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Feb 2016 12:04:55 -0500
Received: by mail-qk0-f170.google.com with SMTP id o6so72714946qkc.2
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Feb 2016 09:04:55 -0800 (PST)
Date: Tue, 9 Feb 2016 12:04:52 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 6/6] kconfig option for TRIM_UNUSED_EXPSYMS
In-Reply-To: <20160209132840.GA7303@infradead.org>
Message-ID: <alpine.LFD.2.20.1602091158360.17825@knanqh.ubzr>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org> <1454963315-20468-7-git-send-email-nicolas.pitre@linaro.org> <20160209132840.GA7303@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On Tue, 9 Feb 2016, Christoph Hellwig wrote:

> On Mon, Feb 08, 2016 at 03:28:35PM -0500, Nicolas Pitre wrote:
> > The config option to enable it all.
> 
> Just enable it by default..

:-)

Viro took the opposite view with this patch:

http://lkml.org/lkml/2016/2/3/1068

where he's ensuring that no exports are dropped, even if obviously 
they're not used (otherwise some complaints would have come about).  So 
I'm not sure if having this turned on by default is a good thing.

But I don't mind being convinced otherwise.


Nicolas
