Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60209 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754121Ab2J3P2t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Oct 2012 11:28:49 -0400
Message-ID: <508FF226.4030802@suse.cz>
Date: Tue, 30 Oct 2012 16:28:38 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] [KBUILD] Put the CROSS_COMPILE and ARCH variables in
 the build directory makefile
References: <20120930232005.GB30637@obsidianresearch.com> <508FDA2B.9000001@suse.cz> <20121030151913.GA13176@obsidianresearch.com>
In-Reply-To: <20121030151913.GA13176@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: linux-kbuild@vger.kernel.org

On 30.10.2012 16:19, Jason Gunthorpe wrote:
> On Tue, Oct 30, 2012 at 02:46:19PM +0100, Michal Marek wrote:
>> Are you sure this is not going to suffer from the same issues as
>> 5755433? See
> 
> Thanks for this link, this is the first time I've seen that, so no :)
> 
> The approaches are different, my version that uses mkmakefile probably
> avoids some problems (like the quoting issue) but I'm not sure about
> mrproper. I've never seen mrproper complain, but I've always used this
> patch with O=..
> 
> Let me review this information and get back to you.

Good luck :). BTW, here is what people reported about Sam's approach in
2009: http://lkml.indiana.edu/hypermail/linux/kernel/0910.1/index.html#00505

Michal
