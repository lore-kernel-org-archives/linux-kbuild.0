Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0223.hostedemail.com ([216.40.44.223]:55215 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753228AbcCRFkr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 01:40:47 -0400
Message-ID: <1458279643.9556.52.camel@perches.com>
Subject: Re: [GIT PULL v4.6] MDB Linux Kernel Debugger x86/x86_64
From: Joe Perches <joe@perches.com>
Date: Thu, 17 Mar 2016 22:40:43 -0700
In-Reply-To: <CA+ekxPUten_O4=bUnnGbOGosO3vOe4zpteuWKDatwY4i-aVB7w@mail.gmail.com>
References: <20160314235035.GA5799@localhost.localdomain>
	 <1457999823.11972.143.camel@perches.com>
	 <20160315112458.7248d665@canb.auug.org.au>
	 <CA+ekxPU9D9dfhtzEP+bEvTthg3M_UWyY1zQHaRb0APppp-t7-g@mail.gmail.com>
	 <20160315130339.688689bd@canb.auug.org.au>
	 <20160315151618.GQ29218@thunk.org>
	 <CA+ekxPUKXFHsUnUme2J12P8tuv5Obb3r7+vO9BOd551Uzp-btg@mail.gmail.com>
	 <CA+ekxPUten_O4=bUnnGbOGosO3vOe4zpteuWKDatwY4i-aVB7w@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeffrey Merkey <jeffmerkey@gmail.com>, Theodore Ts'o <tytso@mit.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, 2016-03-17 at 23:31 -0600, Jeffrey Merkey wrote:
> On 3/16/16, Jeffrey Merkey <jeffmerkey@gmail.com> wrote:
> > On 3/15/16, Theodore Ts'o <tytso@mit.edu> wrote:
> > > On Tue, Mar 15, 2016 at 01:03:39PM +1100, Stephen Rothwell wrote:
> > > > 
> > > > We don't generally PGP (GPG) sign commits in the kernel tree (so "-S"
> > > > is not required), just tags.  However we always require that anyone who
> > > > handles a patch adds a Signed-off-by line to the final commit.  See
> > > > Documentation/SubmittingPatches Section 11.
> > > In general all commits should have a Signed-Off-By line added.  Once
> > > the git branch gets merged, it's hard to tell what is the final commit
> > > and what isn't, and in general different commits will have different
> > > people needing to vouch for the origins for the contents of that commit.
[]
> > I will repost this pull request with a signed-off by line for Linus to
> > consider.    I am not certain who all should be included in the review
> > and I have to be careful how many email recipients I copy.   I will
> > post to the folks Joe Perches copied.
[]
> Well, Joe updated checkpatch.pl so now there are some more areas of
> cleanup I need to do on the code to remove unsigned casts and replace
> them with unsigned int.  I will resubmit at the next merge window for
> 4.7.  Have not heard a word from Linus about this, Hey Linus, please
> don't lion-us by throwing us to the lions.  :-)

I rather doubt Linus is going to pull this code during
this merge window.

I think you should try to get this into -next immediately
after this current merge window closes in a 10 or so days.

I think you don't have to do random cleanups just to
satisfy checkpatch.  Get the code in -next and then
cleanup stuff as you see fit.  There will then be
individual commit changelogs for the mostly whitespace
changes that checkpatch might point out.

