Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42044 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752192AbcDZVf0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 17:35:26 -0400
Date: Tue, 26 Apr 2016 14:35:19 -0700
From: Benjamin Poirier <bpoirier@suse.com>
Subject: Re: [PATCH v2] localmodconfig: Fix whitespace repeat count after
 "tristate"
Message-ID: <20160426213519.GA4812@f1.synalogic.ca>
References: <20160426185421.GB2979@f1.synalogic.ca>
 <1461696998-3953-1-git-send-email-bpoirier@suse.com>
 <20160426155132.3cdf9adf@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160426155132.3cdf9adf@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016/04/26 15:51, Steven Rostedt wrote:
> On Tue, 26 Apr 2016 11:56:38 -0700
> Benjamin Poirier <bpoirier@suse.com> wrote:
> 
> > Also recognize standalone "prompt".
> > 
> > Before this patch we incorrectly identified some symbols as not having a
> > prompt and potentially needing to be selected by something else.
> > 
> > Note that this patch could theoretically change the resulting .config,
> > causing it to have fewer symbols turned on. However, given the current set
> > of Kconfig files, this situation does not occur because the symbols newly
> > added to %prompts are absent from %selects.
> > 
> > Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
> > ---
> >  scripts/kconfig/streamline_config.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index 95a6f2b..b8c7b29 100755
> > --- a/scripts/kconfig/streamline_config.pl
> > +++ b/scripts/kconfig/streamline_config.pl
> > @@ -237,7 +237,7 @@ sub read_kconfig {
> >  	    }
> >  
> >  	# configs without prompts must be selected
> > -	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
> > +	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
> 
> I prefer not to have the "prompt" here. I'm only interested in module
> configs. But the \s to \s+ is a real fix.

Separate tristate and prompt statements are allowed and recognized by
the kconfig parser. Although there are no such cases now, there used to
be one: 0a57274
You sure you want to remove it from the regexp?
