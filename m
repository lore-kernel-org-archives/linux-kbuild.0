Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51580 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671AbbASK2k (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Jan 2015 05:28:40 -0500
Date: Mon, 19 Jan 2015 11:28:27 +0100 (CET)
From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH v2 1/2] kconfig: don't silently ignore unhandled
 characters
In-Reply-To: <1421430826.8562.42.camel@x220>
Message-ID: <alpine.LNX.2.00.1501191127580.10817@pobox.suse.cz>
References: <54B93FE60200007800055E84@mail.emea.novell.com>  <1421425532.8562.32.camel@x220>  <54B94B3E0200007800055F77@mail.emea.novell.com> <1421430826.8562.42.camel@x220>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Jan Beulich <JBeulich@suse.com>, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Fri, 16 Jan 2015, Paul Bolle wrote:

> > > I guess Michal would like to split the c_shipped changes in this patch
> > > too. (I personally don't care.) And I think the sound/soc/intel/Kconfig
> > > should be a separate patch. 
> > 
> > I simply didn't want the patch to create fallout (even if it's just
> > warnings). If doing this here is deemed inappropriate, I'd likely
> > drop the adjustment altogether and just mention the effect the
> > patch has. Following up with the various subsystem maintainers
> > until they pick up patches is, hmm, difficult.
> 
> Certainly. Just a few days ago I sent out a reminder to some maintainers
> that, at best, borders on counterproductive.
> 
> In this case Jiri might be the quickest road to trivial success. Jiri
> responds in a reasonable time, hardly ever misses patches, and doesn't
> bark if you dare send a reminder. Anyhow, I wish I had sent out the
> trivial patch to fix that Kconfig last year. Then we wouldn't have had
> this conversation.

Could you please submit the patches to me properly so that I can take them 
through my trivial tree machine if applicable?

Thanks,

-- 
Jiri Kosina
SUSE Labs
