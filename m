Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:54983 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755330AbaBRO7E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:59:04 -0500
Date: Wed, 19 Feb 2014 01:28:56 +1030
From: Alan Modra <amodra@gmail.com>
Subject: Re: [RFC] kbuild: drop use of "ld -r" for intermediate links of
 vmlinux
Message-ID: <20140218145856.GZ3386@bubble.grove.modra.org>
References: <20140216203724.GA19216@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140216203724.GA19216@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, mmarek@suse.cz, Cary Coutant <ccoutant@google.com>

On Sun, Feb 16, 2014 at 09:37:24PM +0100, Sam Ravnborg wrote:
> The trick used is that for each directory a linker script is
> generated that name all the file to be linked - and for
> sub-directories this is just the linker script for that directory.
> 
> The file continue to be named "built-in.o" but it is really a linker script.

You'll need binutils newer than 2012-06-25
https://sourceware.org/ml/binutils/2012-06/msg00201.html

> I recall the idea is from someone else - but have long lost memory of
> from where I saw it.

I think it might have been my idea originally, implemented by Stephen
Rothwell.

Another possibility is to use thin archives to package up the objects.
Thin archives are like normal archives except they just contain paths
to the objects, not the object contents.  Paths are flattened when
adding one thin archive to another.  I think Stephen may have tried
that idea too.

-- 
Alan Modra
Australia Development Lab, IBM
