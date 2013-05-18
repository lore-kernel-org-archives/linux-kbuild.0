Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:46328 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751530Ab3ERRfl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 May 2013 13:35:41 -0400
MIME-Version: 1.0
In-Reply-To: <20130517193658.GA32023@pobox.suse.cz>
References: <20130517193658.GA32023@pobox.suse.cz>
Date: Sat, 18 May 2013 10:35:40 -0700
Message-ID: <CA+55aFzYf6aCXcCE8=M53OumqvXj_TYb5z7vibe9UDf79xaehw@mail.gmail.com>
Subject: Re: [GIT] kbuild fix for v3.10-rc2
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: lcapitulino@redhat.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 17, 2013 at 12:36 PM, Michal Marek <mmarek@suse.cz> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git for-next
>
> Luiz Capitulino (1):
>       package: Makefile: unbreak binrpm-pkg target
>
>  scripts/package/Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Hmm. That's not at all what I get. I also get a merge and another
patch ("kbuild: fix make headers_install when path is too long") and

 scripts/Makefile.headersinst | 20 ++++++++++++++------
 scripts/headers_install.sh   |  7 +++++--
 scripts/package/Makefile     |  2 +-
 3 files changed, 20 insertions(+), 9 deletions(-)

which may all be intentional, but I don't see any updated pull
requests, so I'm not pulling..

              Linus
