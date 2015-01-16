Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews09.kpnxchange.com ([213.75.39.14]:64498 "EHLO
	cpsmtpb-ews09.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752132AbbAPRxs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jan 2015 12:53:48 -0500
Message-ID: <1421430826.8562.42.camel@x220>
Subject: Re: [PATCH v2 1/2] kconfig: don't silently ignore unhandled
 characters
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 16 Jan 2015 18:53:46 +0100
In-Reply-To: <54B94B3E0200007800055F77@mail.emea.novell.com>
References: <54B93FE60200007800055E84@mail.emea.novell.com>
	 <1421425532.8562.32.camel@x220>
	 <54B94B3E0200007800055F77@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Jiri Kosina <jkosina@suse.cz>, akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Fri, 2015-01-16 at 16:32 +0000, Jan Beulich wrote:
> >>> On 16.01.15 at 17:25, <pebolle@tiscali.nl> wrote:
> > On Fri, 2015-01-16 at 15:44 +0000, Jan Beulich wrote:
> >>  scripts/kconfig/zconf.l             |    7 +
> >>  scripts/kconfig/zconf.lex.c_shipped |  195 +++++++++++++++++++-----------------
> >>  sound/soc/intel/Kconfig             |    4 
> > 
> > I guess Michal would like to split the c_shipped changes in this patch
> > too. (I personally don't care.) And I think the sound/soc/intel/Kconfig
> > should be a separate patch. 
> 
> I simply didn't want the patch to create fallout (even if it's just
> warnings). If doing this here is deemed inappropriate, I'd likely
> drop the adjustment altogether and just mention the effect the
> patch has. Following up with the various subsystem maintainers
> until they pick up patches is, hmm, difficult.

Certainly. Just a few days ago I sent out a reminder to some maintainers
that, at best, borders on counterproductive.

In this case Jiri might be the quickest road to trivial success. Jiri
responds in a reasonable time, hardly ever misses patches, and doesn't
bark if you dare send a reminder. Anyhow, I wish I had sent out the
trivial patch to fix that Kconfig last year. Then we wouldn't have had
this conversation.


Paul Bolle

