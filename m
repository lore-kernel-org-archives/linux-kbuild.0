Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:39961 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966074AbaFTMW0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Jun 2014 08:22:26 -0400
Date: Fri, 20 Jun 2014 21:22:12 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] scripts/Makefile.clean: clean also $(extra-m) and $(extra-)
In-Reply-To: <53A1EE1E.3090906@suse.cz>
References: <539963D4.3040409@suse.cz> <53A1EE1E.3090906@suse.cz>
Message-Id: <20140620212212.9339.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi Michal,


On Wed, 18 Jun 2014 21:53:02 +0200
Michal Marek <mmarek@suse.cz> wrote:

> Dne 12.6.2014 10:24, Michal Marek napsal(a):
> > Dne 6.6.2014 03:43, Masahiro Yamada napsal(a):
> >> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> >> ---
> >>  scripts/Makefile.clean | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
> >> index 686cb0d..a651cee 100644
> >> --- a/scripts/Makefile.clean
> >> +++ b/scripts/Makefile.clean
> >> @@ -40,8 +40,8 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
> >>  # build a list of files to remove, usually relative to the current
> >>  # directory
> >>  
> >> -__clean-files	:= $(extra-y) $(always)                  \
> >> -		   $(targets) $(clean-files)             \
> >> +__clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
> >> +		   $(always) $(targets) $(clean-files)   \
> > 
> > Do you have an example where generated files are left in the tree after
> > make clean? This should go into the changelog.
> 
> Hi Masahiro,
> 
> do you have a reproducer, i.e. an example where make clean leaves
> generated files in the tree?

No, I don't.

I thought
arch/powerpc/kernel/Makefile is using
extra-$(CONFIG_...) += ...
but  *.o  files are simply cleaned-up.  So this isn't the case.


Best Regards
Masahiro Yamada

