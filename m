Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45234 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752538AbbFKMgS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jun 2015 08:36:18 -0400
Message-ID: <557980BE.6030601@suse.cz>
Date: Thu, 11 Jun 2015 14:36:14 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/3] kconfig: don't silently ignore unhandled characters
References: <54BE5DB00200007800057062@mail.emea.novell.com>
In-Reply-To: <54BE5DB00200007800057062@mail.emea.novell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, pebolle@tiscali.nl

On 2015-01-20 13:52, Jan Beulich wrote:
> At the very least we should tell people that what they wrote is not
> what the utility understands.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> v3: Split off sound/soc/intel/Kconfig change.
> v2: printf() -> fprintf(stderr, ) upon Paul Bolle's request. Replace
>     two instances of double backslash line continuations with single
>     ones in sound/soc/intel/Kconfig.

Sorry, I completely missed v3 of this series. I applied this patch to
kbuild.git#kconfig now.

Michal
