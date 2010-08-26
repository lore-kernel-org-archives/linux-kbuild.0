Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:58038 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240Ab0HZMLY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Aug 2010 08:11:24 -0400
Date: Thu, 26 Aug 2010 14:11:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: don't overwrite HOST_EXTRACFLAGS
Message-ID: <20100826121122.GA5489@merkur.ravnborg.org>
References: <AANLkTindfnx2htJ--AjyMsKatjkAfXmH+po3pGz6DmfD@mail.gmail.com> <1282521786-26699-1-git-send-email-lacombar@gmail.com> <AANLkTimrN2=DZrAgh=Q4NCgz+UhJ+THdwGPoJRK_826c@mail.gmail.com> <20100826120041.GB24170@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100826120041.GB24170@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Aug 26, 2010 at 02:00:41PM +0200, Michal Marek wrote:
> On Sun, Aug 22, 2010 at 08:17:21PM -0400, Arnaud Lacombe wrote:
> > Hi,
> > 
> > On Sun, Aug 22, 2010 at 8:03 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> > > These might be used by the user to specify extra arguments for the host
> > > compiler.
> > >
> > Do'h... the original patch was against -rc1 and changed both
> > HOST_EXTRACFLAGS and HOST_LOADLIBES, but I cherry-picked it to be
> > against your `for-next' and more particularly commit 7080e47bb, which
> > removes the assignation of HOST_LOADLIBES. As I didn't pay attention
> > and kept the plural :/
> 
> I changed it to "this".
> 
> > Anyway, with this patch and specifying HOST_EXTRACFLAGS in the
> > environment rather than as a gmake(1) argument, it is properly
> > appended. nconf links and runs fine on NetBSD. It should not impact
> > other environment.
> 
> OK, applied.

I do not mind the patch in question.
But do we really want to allow users to override HOST_EXTRACFLAGS?

For the builtin stuff we have a lot of options
to override stuff:

CFLAGS_MODULE, AFLAGS_MODULE, LDFLAGS_MODULE
CFLAGS_KERNEL, AFLAGS_KERNEL
KAFLAGS, KCFLAGS, KCPPFLAGS

Maybe we should formalize it so we give users a _documented_ way to
add additional options to the host CC?

As per above this could be: HOSTCFLAGS

Patch is simple - but what do you think?

	Sam
