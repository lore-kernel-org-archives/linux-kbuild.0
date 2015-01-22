Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44738 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751170AbbAVKd0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2015 05:33:26 -0500
Message-ID: <54C0D1F3.6000001@suse.cz>
Date: Thu, 22 Jan 2015 11:33:23 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] [RFC] kconfig: menuconfig make "Selected by:" readable
References: <1421881250.13638.10.camel@x220>	 <54C05F33.6070703@infradead.org> <1421915745.13638.27.camel@x220>
In-Reply-To: <1421915745.13638.27.camel@x220>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org

On 2015-01-22 09:35, Paul Bolle wrote:
> In this case 64BIT is set to 'y' (otherwise LBDAF would have been 'y').
> This isn't a bug issue, of course, but I still can see how this can be
> confusing. Perhaps the last line should read:
>       Unmet dependency on: BLOCK [=y] && !64BIT [=y]
> 
> Would that help? Or would 
>       Depends on: BLOCK [=y] && !64BIT [=n]
> 
> (ie, print the value if "!64BIT") be clearer?

How about

  Depends on: (BLOCK [=y] && !64BIT [=y]) [=n]

?

Michal
