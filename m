Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34266 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752189AbcDZSy1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 14:54:27 -0400
Date: Tue, 26 Apr 2016 11:54:21 -0700
From: Benjamin Poirier <bpoirier@suse.com>
Subject: Re: [PATCH 4/4] localmodconfig: Recognize standalone "prompt"
Message-ID: <20160426185421.GB2979@f1.synalogic.ca>
References: <20160410235234.GA13689@f1.synalogic.ca>
 <1460333193-16361-1-git-send-email-bpoirier@suse.com>
 <1460333193-16361-4-git-send-email-bpoirier@suse.com>
 <20160426111136.6f8c197f@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160426111136.6f8c197f@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016/04/26 11:11, Steven Rostedt wrote:
> On Sun, 10 Apr 2016 17:06:33 -0700
> Benjamin Poirier <bpoirier@suse.com> wrote:
> 
> > Note that this may change the resulting .config, causing it to have fewer
> > symbols turned on. Before this patch we incorrectly identified some symbols
> > as not having a prompt and needing to be selected by something else.
> > 
> > Also fix the whitespace repeat after "tristate".
> > 
> > Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
> > ---
> >  scripts/kconfig/streamline_config.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index bbc160c..d465672 100755
> > --- a/scripts/kconfig/streamline_config.pl
> > +++ b/scripts/kconfig/streamline_config.pl
> > @@ -237,7 +237,7 @@ sub read_kconfig {
> >  	    }
> >  
> >  	# configs without prompts must be selected
> > -	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
> > +	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
> 
> I'm curious. What modules have tristate and a specified prompt?

Actually, I didn't find config symbols that are tristate and have a separate
prompt. However, the following tristate symbols were not recognized by the
original expression because they are defined with two spaces between
"tristate" and the prompt string (sigh):
	IP6_NF_RAW
	IP_NF_RAW
	NETFILTER_XT_MATCH_COMMENT
	NETFILTER_XT_MATCH_CONNBYTES
	NETFILTER_XT_MATCH_CONNMARK
	NETFILTER_XT_MATCH_REALM
	NETFILTER_XT_MATCH_SCTP
	NETFILTER_XT_MATCH_STRING
	NETFILTER_XT_TARGET_CONNMARK
	NETFILTER_XT_TARGET_IDLETIMER
	NETFILTER_XT_TARGET_NOTRACK
	NETFILTER_XT_TARGET_TRACE
	NF_CT_NETLINK_TIMEOUT
	USB_EHCI_HCD_AT91
	USB_EHCI_HCD_ORION

So they were not added to %prompts and now they are.

> 
> That is, what modules are removed with this patch?
> 

None, it turns out. Because it is the case that none of the above symbols are
selected by other symbols; the second condition in
	    if (!defined($prompts{$config}) && defined($selects{$config})) {
		$process_selects{$config} = 1;
	    }
is always false for these symbols.

I've updated the patch subject and log accordingly.
