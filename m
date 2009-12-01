Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cable-static-49-187.intergga.ch ([157.161.49.187]:34049 "EHLO
	mail.ffwll.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753976AbZLAJuR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Dec 2009 04:50:17 -0500
Date: Tue, 1 Dec 2009 10:42:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] kbuild: specify absolute paths for cscope
Message-ID: <20091201094222.GC9177@viiv.ffwll.ch>
References: <1259238852-21214-1-git-send-email-daniel.vetter@ffwll.ch>
 <4B13FD4B.5080805@suse.cz>
 <20091130181109.GA19614@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091130181109.GA19614@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Mon, Nov 30, 2009 at 07:11:09PM +0100, Sam Ravnborg wrote:
> On Mon, Nov 30, 2009 at 06:13:47PM +0100, Michal Marek wrote:
> > On 26.11.2009 13:34, Daniel Vetter wrote:
> > > Some tools (like my favourite editor, vim) can't handle relative
> > > paths from cscope as soon as cscope.out is no longer in $PWD. Use
> > > absolute paths when generating cscope.files, which seems to be
> > > the recommended way to generate cscope.out, anyway (at least according
> > > to cscope.sf.net).
> > 
> > But it will fail if you rename the source directory. I'm not sure what
> > is worse, I myself don't use cscope much. Fixing vim would be the ideal
> > solution of course (it already handles ../tags fine).
> 
> For tags I recall we fall back to absolute path only for O=... builds.
> This made the tags file considerably smaller for a non O=.. build
> thus speeding up the search.
> 
> So unconditionally using absolute paths for cscope may have drawbacks.

I've just tried to use cscope with a working directory not equal to the
directory where cscope.out resides:

$ cscope -d -f src/cscope.out

It can't handle relative paths. When I try to open a file (via a
reference) from within cscope, it calls up vim with the wrong path.  So I
think this is a fundamental cscope bug (and not a vim problem).  As I've
already said, every tutorial on the web I could find uses absolute paths,
too, so the problem seems to be common, as is the work-around.  Therefore
please apply this patch (perhaps changing my comment to "cscope is broken
with relative paths, work around it via absolute paths").

Thanks, Daniel
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
