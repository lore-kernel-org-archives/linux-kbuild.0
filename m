Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews05.kpnxchange.com ([213.75.39.8]:59601 "EHLO
	cpsmtpb-ews05.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753979AbbCLMlz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 08:41:55 -0400
Message-ID: <1426164113.5304.54.camel@x220>
Subject: Re: [PATCH] Kconfig: drop bogus default values
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 12 Mar 2015 13:41:53 +0100
In-Reply-To: <5501966D0200007800068FFB@mail.emea.novell.com>
References: <5500584D02000078000688F5@mail.emea.novell.com>
	 <1426162307.5304.41.camel@x220>
	 <5501966D0200007800068FFB@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-03-12 at 12:36 +0000, Jan Beulich wrote:
> >>> On 12.03.15 at 13:11, <pebolle@tiscali.nl> wrote:
> > On Wed, 2015-03-11 at 13:59 +0000, Jan Beulich wrote:
> >> Default "no" is pretty pointless for options without (visible) prompts:
> > 
> > Related: is there ever a situation where using "default n" or "def_bool
> > n" makes sense (whether or not the entry has a prompt)? I think I once
> > thought of one but I can't remember it at all, so I guess my memory is
> > fooling me.
> 
> I can't see any, but since as long as there is a visible prompt this
> doesn't have any other bad effect than bloating the Kconfig file
> and making its parsing a tiny bit slower, I don't care that much
> about those (originally I had started a patch removing those too,
> but gave up after a while).

Well, unless someone comes up with a valid reason to add "default
n" (and, again, I don't think what you ran into is a valid reason) we
might instead bloat checkpatch.pl a bit by adding a warning for it. That
should at least stop new instances from being added.

I wonder whether Michal knows of a valid reason to use "default n"? What
are Jan and I missing here?


Paul Bolle

