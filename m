Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58931 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755724AbbAIJk1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Jan 2015 04:40:27 -0500
Message-ID: <54AFA209.7030600@suse.cz>
Date: Fri, 09 Jan 2015 10:40:25 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [GIT PULL] make mrproper fix for v3.19-rc4
References: <20150108104933.GA25083@sepie.suse.cz> <CA+55aFxrc1CiyjQfWoZHD6UgwOTgj=NVBXPPsY2eygfPMzgsPg@mail.gmail.com>
In-Reply-To: <CA+55aFxrc1CiyjQfWoZHD6UgwOTgj=NVBXPPsY2eygfPMzgsPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 2015-01-08 23:42, Linus Torvalds wrote:
> Just do
> 
>     make allmodconfig
>     .. build the tree ..
>     make distclean
>     git ls-files -o
> 
> to see any files that are left-over despite the distclean ("git
> ls-files -o" basically shows all untracked files - 'o' stands for
> 'others' - so anything that isn't in the actual distributed sources
> shows up)

The x86 files should actually be removed by make clean. The bug is that
the $(targets) variable must not depend on the configuration, so that
make clean always knows what to delete. I'll send a patch to the x86
maintainers, but such bugs keep creeping in. Other archs possibly have a
similar prolbem.

security/tomoyo automatically generates files that can also be supplied
by the user, which sucks, because make clean does not know whether they
are generated or user supplied.


> But I really am not sure how much effort we should spend on "make
> distclean", given than "git clean" is so much easier and requires no
> effort at all.

With git clean and git archive, there is indeed little use for make
distclean. But clean and mrproper should work.

Michal
