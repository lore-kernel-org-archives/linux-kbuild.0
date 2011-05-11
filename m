Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.vyatta.com ([76.74.103.46]:48590 "EHLO mail.vyatta.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932229Ab1EKWjo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 May 2011 18:39:44 -0400
Date: Wed, 11 May 2011 15:39:38 -0700
From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: [PATCH] fix unterminated sed cmd in export_report.pl
Message-ID: <20110511153938.2c441429@nehalam>
In-Reply-To: <BANLkTimxtJeYMxnaA4Ovz0XOAZJKvB+yzA@mail.gmail.com>
References: <1305064543-7401-1-git-send-email-jim.cromie@gmail.com>
	<alpine.LNX.2.00.1105111126580.28291@pobox.suse.cz>
	<BANLkTi=JzPH6m2aCehfE=9WbJkUiqzZgWQ@mail.gmail.com>
	<BANLkTi=OfD7W7u7+ujRGjAbR3mYFaNwwMw@mail.gmail.com>
	<BANLkTimxtJeYMxnaA4Ovz0XOAZJKvB+yzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Wed, 11 May 2011 16:26:23 -0600
Jim Cromie <jim.cromie@gmail.com> wrote:

> On Wed, May 11, 2011 at 3:26 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> > Hi
> >
> > On Wed, May 11, 2011 at 5:16 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> >> -     = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
> >> +     = `sed '/\.ko$/!d; s/\.ko$/.mod.c/' .tmp_versions/*.mod`;
> >>
> > Actually, my perl-fuu is not what it used to be, that one should be better:
> >
> > +     = `sed '/\\.ko\$/!d; s/\\.ko\$/.mod.c/' .tmp_versions/*.mod`;
> >
> > The backslash before the '.' should be escaped as well to be passed to
> > sed(1). I'll give it a try to confirm.
> >
> >  - Arnaud
> >
> 
> 
> I agree w your complicated-construct sentiment re the cmd-pipeline.
> 
> this used to be done with a grep,
> undone by
> 
> 
> commit 91416cfdf98bdbc828fd3e5ca7208beba5979d63
> Author: Stephen Hemminger <shemminger@vyatta.com>
> Date:   Mon Feb 22 15:17:22 2010 -0800
> 
>     export_report: fix perl warnings
> 
>     Use local file handles, use three argument open.
>     Don't modify arguments in perl grep (use sed instead)
> 
>     Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
>     Acked-by: WANG Cong <amwang@redhat.com>
>     Cc: Michal Marek <mmarek@suse.cz>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Michal Marek <mmarek@suse.cz>
> 
> diff --git a/scripts/export_report.pl b/scripts/export_report.pl
> index 705b5ba..04dce7c 100644
> --- a/scripts/export_report.pl
> +++ b/scripts/export_report.pl
> @@ -49,10 +49,10 @@ sub usage {
>  }
> 
>  sub collectcfiles {
> -        my @file = `cat .tmp_versions/*.mod | grep '.*\.ko\$'`;
> -        @file = grep {s/\.ko/.mod.c/} @file;
> -       chomp @file;
> -        return @file;
> +    my @file
> +       = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
> +    chomp @file;
> +    return @file;
>  }
> 
> 
> the backslash escape noise in the subshell pipeline can be avoided
> by returning to the grep, with less process spawning too
> (not that this is executed often)
> I'll try that.

Even better would be doing the work in perl rather than using
shell for this.
