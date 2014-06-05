Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:58145 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354AbaFEUaX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 16:30:23 -0400
Received: by mail-qa0-f46.google.com with SMTP id w8so2130093qac.19
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jun 2014 13:30:23 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] selinux, kbuild: remove unnecessary $(hostprogs-y) from clean-files
Date: Thu, 05 Jun 2014 16:30:20 -0400
Message-ID: <1539785.Vu4DnvQCIK@sifl>
In-Reply-To: <20140605161823.9579.AA925319@jp.panasonic.com>
References: <20140603144739.321C.AA925319@jp.panasonic.com> <5995003.J2pCs3i8WU@sifl> <20140605161823.9579.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Michal Marek <mmarek@suse.cz>, selinux@tycho.nsa.gov, linux-kbuild@vger.kernel.org

On Thursday, June 05, 2014 04:18:23 PM Masahiro Yamada wrote:
> Hi Paul, Michal,
> 
> On Tue, 03 Jun 2014 18:27:41 -0400
> 
> Paul Moore <paul@paul-moore.com> wrote:
> > On Tuesday, June 03, 2014 02:47:39 PM Masahiro Yamada wrote:
> > > Hi Paul Moore,
> > 
> > Hello.
> > 
> > > On Thu, 17 Apr 2014 21:41:53 -0400 Paul Moore wrote:
> > > > On Thursday, April 17, 2014 11:42:26 AM Masahiro Yamada wrote:
> > > > > Files added to hostprogs-y are cleaned. (See scripts/Makefile.clean)
> > > > > Adding them to clean-files is redundant.
> > > > > 
> > > > > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > > > > ---
> > > > > 
> > > > >  scripts/selinux/genheaders/Makefile | 1 -
> > > > >  scripts/selinux/mdp/Makefile        | 2 +-
> > > > >  2 files changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > Acked-by: Paul Moore <paul@paul-moore.com>
> > > 
> > > It looks like this patch was not included into
> > > GIT-PULL of "SELinux patches for 3.16".
> > > 
> > > Is it possible to apply this and send another pull request?
> > 
> > My apologies, I thought the kbuild people were going to merge this patch;
> > this is why I sent my Acked-by instead of a note that I've merged the
> > patch. Considering that this patch doesn't actually fix any runtime
> > problems and it hasn't been in any of the different "next" trees, I think
> > it is best to wait until 3.17 for this patch.
> > 
> > I've added this patch to my queue of patches to be added to the SELinux
> > #next branch after the 3.16 merge window closes.
> > 
> > Thanks again for the patch, I'm sorry that we didn't get it merged sooner.
> 
> No worries.
> 
> Michal, could you apply this patch to kbuild.git#kbuild, please?

As I said, it is not a problem for me to carry the patch in the SELinux tree.

-- 
paul moore
www.paul-moore.com

