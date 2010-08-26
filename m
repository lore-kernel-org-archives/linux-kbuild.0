Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:47995 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752698Ab0HZMAn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Aug 2010 08:00:43 -0400
Date: Thu, 26 Aug 2010 14:00:41 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: don't overwrite HOST_EXTRACFLAGS
Message-ID: <20100826120041.GB24170@sepie.suse.cz>
References: <AANLkTindfnx2htJ--AjyMsKatjkAfXmH+po3pGz6DmfD@mail.gmail.com>
 <1282521786-26699-1-git-send-email-lacombar@gmail.com>
 <AANLkTimrN2=DZrAgh=Q4NCgz+UhJ+THdwGPoJRK_826c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTimrN2=DZrAgh=Q4NCgz+UhJ+THdwGPoJRK_826c@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On Sun, Aug 22, 2010 at 08:17:21PM -0400, Arnaud Lacombe wrote:
> Hi,
> 
> On Sun, Aug 22, 2010 at 8:03 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> > These might be used by the user to specify extra arguments for the host
> > compiler.
> >
> Do'h... the original patch was against -rc1 and changed both
> HOST_EXTRACFLAGS and HOST_LOADLIBES, but I cherry-picked it to be
> against your `for-next' and more particularly commit 7080e47bb, which
> removes the assignation of HOST_LOADLIBES. As I didn't pay attention
> and kept the plural :/

I changed it to "this".

> Anyway, with this patch and specifying HOST_EXTRACFLAGS in the
> environment rather than as a gmake(1) argument, it is properly
> appended. nconf links and runs fine on NetBSD. It should not impact
> other environment.

OK, applied.

Michal
