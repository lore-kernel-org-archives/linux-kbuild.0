Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:42956 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763963AbZD3WxU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2009 18:53:20 -0400
Date: Thu, 30 Apr 2009 18:53:17 -0400 (EDT)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/7] kconfig: enable CONFIG_IKCONFIG from
 streamline_config.pl
In-Reply-To: <9b2b86520904301451v1d77589l7ee48217fb64e567@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.0904301852441.20374@gandalf.stny.rr.com>
References: <20090430185022.122124349@goodmis.org>  <20090430185219.656122641@goodmis.org> <9b2b86520904301451v1d77589l7ee48217fb64e567@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <sourcejedi.lkml@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>


On Thu, 30 Apr 2009, Alan Jenkins wrote:
> > +
> > +    if (/CONFIG_IKCONFIG/) {
> > +	if (/# CONFIG_IKCONFIG is not set/) {
> > +	    # enable IKCONFIG at least as a module
> > +	    print "CONFIG_IKCONFIG=m\n";
> > +	    # don't ask about PROC
> > +	    print "# CONFIG_IKCONFIG is not set\n";
> 
> I assume the second one should be CONFIG_IKCONFIG_PROC :-).

Ag! Thanks!

> 
> > +	} else {
> > +	    print;
> > +	}
> > +	next;
> > +    }
> > +
> > +    if (/^(CONFIG.*)=(m|y)/) {
> > +	if (defined($configs{$1})) {
> > +	    $setconfigs{$1} = $2;
> > +	    print;
> > +	} elsif ($2 eq "m") {
> > +	    print "# $1 is not set\n";
> >  	} else {
> > -		print;
> > +	    print;
> >  	}
> 
> > +    } else {
> > +	print;
> > +    }
> 
> 
> Maybe it would be cleaner make the two "if" blocks the same; i.e. do
> this instead:

Yeah, that does look cleaner.

-- Steve

> 
> +	next;
> +    }
> +
> +	print;
> 
> 
> >  }
> >  close(CIN);
> >
> 
