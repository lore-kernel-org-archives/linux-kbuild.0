Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:35076 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751767AbbILUGS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Sep 2015 16:06:18 -0400
Date: Sat, 12 Sep 2015 14:06:16 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Reproducible-builds] [PATCH 2/2] DocBook: Use a fixed encoding
 for output
Message-ID: <20150912140616.672b5d5a@lwn.net>
In-Reply-To: <878u8ceisu.fsf@alice.fifthhorseman.net>
References: <1441147632.9215.42.camel@decadent.org.uk>
	<1441147759.9215.44.camel@decadent.org.uk>
	<20150911133059.77455c16@lwn.net>
	<878u8ceisu.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Cc: Ben Hutchings <ben@decadent.org.uk>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, =?UTF-8?B?SsOpcsOpbXk=?= Bobbio <lunar@debian.org>, linux-doc@vger.kernel.org, Michal Marek <mmarek@suse.com>, reproducible-builds@lists.alioth.debian.org

On Fri, 11 Sep 2015 17:40:33 -0400
Daniel Kahn Gillmor <dkg@fifthhorseman.net> wrote:

> I sympathize with Jonathan's general concern here -- if this patchset
> makes it impossible for people to build documentation with (for example)
> their preferred collation order, it would be suboptimal.
> 
> On the other hand, this seems to focus on character encodings
> specifically; do we really want to encourage any sort of encodings other
> than UTF-8?  The only plausible arguments i've heard for documents that
> are exclusively CJK characters, which could achieve a modest size
> reduction using more targeted encodings.  afaik, there are no such
> documents in the kernel, and i doubt there ever will be.

Well, there are CJK documents in the kernel, actually, though none are in
the DocBook directory currently.

Regardless of this, it's not a matter of which encodings we are
encouraging.  If we want to encourage utf-8 use, we might not want to
start in the kernel's documentation directory.  I think we need to
respect the user's choice in this regard and not try to override it.  If
I take this patch, I suspect somebody will yell at me for it...

With regard to reproducible builds: success in this area certainly
requires reproducing the build environment as well.  Honestly, I think
that needs to include the locale settings.

Let me know if you think I've totally misunderstood things.

jon
