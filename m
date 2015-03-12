Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews08.kpnxchange.com ([213.75.39.13]:50665 "EHLO
	cpsmtpb-ews08.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754453AbbCLMLt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 08:11:49 -0400
Message-ID: <1426162307.5304.41.camel@x220>
Subject: Re: [PATCH] Kconfig: drop bogus default values
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 12 Mar 2015 13:11:47 +0100
In-Reply-To: <5500584D02000078000688F5@mail.emea.novell.com>
References: <5500584D02000078000688F5@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

[Removed Yann.]

On Wed, 2015-03-11 at 13:59 +0000, Jan Beulich wrote:
> Default "no" is pretty pointless for options without (visible) prompts:

Related: is there ever a situation where using "default n" or "def_bool
n" makes sense (whether or not the entry has a prompt)? I think I once
thought of one but I can't remember it at all, so I guess my memory is
fooling me.

> They only clutter .config-s with "# CONFIG_... is not set" and thus

As far as I can see the main effect of using "default n" is that this
line will be printed. 

> prevent users of "make oldconfig", when the option obtains a prompt or
> its prompt becomes visible, noticing that these may now be enabled.

This side effect doesn't look like a feature. I scanned the source a bit
but - as usual - didn't stumble on a comment that might explain this
behavior. Michal probably feels better at home in the code and might be
able to offer a rationale.


Paul Bolle

