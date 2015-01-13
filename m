Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:56219 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbbAMU1l (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Jan 2015 15:27:41 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] headers_check: don't warn about kexec.h
Date: Tue, 13 Jan 2015 21:27:08 +0100
Message-ID: <2363197.VbAKlSiQLX@wuerfel>
In-Reply-To: <1421169212.15397.22.camel@x220>
References: <12825174.7oxZXDxNhV@wuerfel> <1421169212.15397.22.camel@x220>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Geoff Levand <geoff@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tuesday 13 January 2015 18:13:32 Paul Bolle wrote:
> 
> For the seqbuf_dump() stuff there are apparently users. I forgot the
> details, but the sound people wanted to keep that declaration (and some
> related ancient things) in the header involved to keep some really
> ancient stuff buildable.
> 
> But the kexec_load declaration isn't very useful for userspace, see the
> patch I submitted in
> http://lkml.kernel.org/r/1389791824.17407.9.camel@x220 . And After my
> attempt the export of that declaration has also been discussed in
> http://lkml.kernel.org/r/115373b6ac68ee7a305975896e1c4971e8e51d4c.1408731991.git.geoff@infradead.org 
> 
> In that last discussion no one has been able to point to an actual user
> of it. So, as far as I can tell, no one actually uses it. Which makes
> sense, because including this header by itself doesn't give one access
> to a useful definition of kexec_load. So why bother with the
> declaration?
> 
> The last time that Geoff has been trying to get that patch applied
> should be
> http://lkml.kernel.org/r/b0702fc4186db21820d686e89afd6480560823db.1415837218.git.geoff@infradead.org  I'd rather see that go in.
> 

Fine with me as well. As long as we can find someone to take one of 
the patches, I'm happy.

	Arnd
