Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0193.hostedemail.com ([216.40.44.193]:56962 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751436AbdEGVhJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 17:37:09 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 1DCF2173A82
        for <linux-kbuild@vger.kernel.org>; Sun,  7 May 2017 20:22:04 +0000 (UTC)
Message-ID: <1494188521.31950.43.camel@perches.com>
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
From: Joe Perches <joe@perches.com>
Date: Sun, 07 May 2017 13:22:01 -0700
In-Reply-To: <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
References: <20170507145609.4395-1-n54@gmx.com>
         <1494176499.31950.34.camel@perches.com>
         <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kamil Rytarowski <n54@gmx.com>, linux-kbuild@vger.kernel.org
Cc: apw@canonical.com

On Sun, 2017-05-07 at 22:14 +0200, Kamil Rytarowski wrote:
> On 07.05.2017 19:01, Joe Perches wrote:
> > On Sun, 2017-05-07 at 16:56 +0200, Kamil Rytarowski wrote:
> > > The default NetBSD package manager is pkgsrc and it installs Perl
> > > along other third party programs under custom and configurable prefix.
> > > The default prefix for binary prebuilt packages is /usr/pkg, and the
> > > Perl executable lands in /usr/pkg/bin/perl.
> > > 
> > > This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
> > > the most portable solution that should work for almost everybody.
> > > Perl's executable is detected automatically.
> > > 
> > > This change switches -w option passed to the executable with more
> > > modern "use warnings;" approach. There is no functional change to the
> > > default behavior.
> > 
> > Functionality would then depend on user $PATH.
> 
> Yes.
> 
> > Better?  <shrug>
> 
> Correct.
> 
> In pkgsrc we have automatic scripts to adjust shebangs for scripting
> languages (Perl, Python, Bash etc). But in this case I build the Linux
> kernel out of the pkgsrc context on my NetBSD workstation.
> 
> Exactly the same change has been accepted in qemu, currently it's
> waiting to be merged with master. from the "-trival" branch.
> 
> In my case I won't be enforced to keep fixing it manually every time I
> sync with HEAD. Another point is that the Linux version of this script
> is model and projects fork it, and we need to keep adjusting it downstream.
> 
> > 
> > For the perl "-w", adding "use warnings;" instead of
> > "-w" seems sensible enough.  Is any build environment
> > using a perl version below 5.6?
> > 
> 
> 5.6 was released in 2003.

I know a person using 5.8 (cough: Andrew Morton), but 5.6
really is quite old.

> Out of context of this patch, scripts/namespace.pl ships with "require
> 5" (year 1994?) - removal of this line could be evaluated.

I'm for removal.

