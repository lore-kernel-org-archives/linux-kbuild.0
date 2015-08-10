Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0248.hostedemail.com ([216.40.44.248]:54089 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753037AbbHJPGk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Aug 2015 11:06:40 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 4EFB61743BC
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Aug 2015 14:58:13 +0000 (UTC)
Date: Mon, 10 Aug 2015 10:58:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] localmodconfig: Use Kbuild files too
Message-ID: <20150810105808.6571df03@gandalf.local.home>
In-Reply-To: <CAFLxGvzT11zSu2YDO5Hqr4se0icp=K1MGKhhGZgubVQbu55=mw@mail.gmail.com>
References: <1437948415-16290-1-git-send-email-richard@nod.at>
	<CAFLxGvzT11zSu2YDO5Hqr4se0icp=K1MGKhhGZgubVQbu55=mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, yann.morin.1998@free.fr, artafinde@gmail.com, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Sat, 8 Aug 2015 14:47:32 +0200
Richard Weinberger <richard.weinberger@gmail.com> wrote:

> On Mon, Jul 27, 2015 at 12:06 AM, Richard Weinberger <richard@nod.at> wrote:
> > In kbuild it is allowed to define objects in files named "Makefile"
> > and "Kbuild".
> > Currently localmodconfig reads objects only from "Makefile"s and misses
> > modules like nouveau.
> >
> > Reported-and-tested-by: Leonidas Spyropoulos <artafinde@gmail.com>
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> >  scripts/kconfig/streamline_config.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index 9cb8522..f3d3fb4 100755
> > --- a/scripts/kconfig/streamline_config.pl
> > +++ b/scripts/kconfig/streamline_config.pl
> > @@ -137,7 +137,7 @@ my $ksource = ($ARGV[0] ? $ARGV[0] : '.');
> >  my $kconfig = $ARGV[1];
> >  my $lsmod_file = $ENV{'LSMOD'};
> >
> > -my @makefiles = `find $ksource -name Makefile 2>/dev/null`;
> > +my @makefiles = `find $ksource -name Makefile -or -name Kbuild 2>/dev/null`;
> >  chomp @makefiles;
> >
> >  my %depends;
> > --
> 
> Ping?
> 

Thanks, I'll take a look at this today.

-- Steve

