Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:35066 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759424AbZACUTS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Jan 2009 15:19:18 -0500
Date: Sat, 3 Jan 2009 21:20:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
Message-ID: <20090103202053.GA5066@uranus.ravnborg.org>
References: <1230730656-2987-1-git-send-email-albcamus@gmail.com> <20090102223414.GB8843@uranus.ravnborg.org> <df9815e70901030610w1c61d95bt8259e73c9609a8c3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df9815e70901030610w1c61d95bt8259e73c9609a8c3@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jike Song <albcamus@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sat, Jan 03, 2009 at 10:10:15PM +0800, Jike Song wrote:
> On Sat, Jan 3, 2009 at 6:34 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Wed, Dec 31, 2008 at 09:37:36PM +0800, Jike Song wrote:
> >> This patch reintroduce the ALLSOURCE_ARCHS support for tags/TAGS/
> >> cscope targets. The Kbuild previously has this feature, but after
> >> moving the targets into scripts/tags.sh, ALLSOURCE_ARCHS disappears.
> >>
> >> It's something like this:
> >>
> >>       $ make ALLSOURCE_ARCHS="x86 mips arm" tags cscope
> >
> >
> > A second point...
> > If you are serious about this then we need this documented
> > somewhere. This is not "make help" material so I suggest you
> > to add a new chapter in Documentation/kbuild/kbuild.txt
> > where you could include this.
> 
> Excuse me, do you mean Documentation/kbuild/makefiles.txt instead?

Nope - I mean Documentation/kbuild/kbuild.txt

It is included in kbuild-next.git and will appear in mainline
shortly.

	Sam
