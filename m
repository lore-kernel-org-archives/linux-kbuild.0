Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:32881 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964988AbbJ1I0n (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 04:26:43 -0400
Message-ID: <1446020799.6339.12.camel@tiscali.nl>
Subject: Re: [PATCH 1/1] [RFC] kconfig: menuconfig make "Selected by:"
 readable
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 28 Oct 2015 09:26:39 +0100
In-Reply-To: <562E8B55.1030607@suse.cz>
References: <1442257543-6194-1-git-send-email-petr.vorel@gmail.com>
	 <1442257543-6194-2-git-send-email-petr.vorel@gmail.com>
	 <562E8B55.1030607@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Petr Vorel <petr.vorel@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>

On ma, 2015-10-26 at 21:21 +0100, Michal Marek wrote:
> ... and a cleaner fix would be to patch the printer, instead of
> generating a string representation and converting it.

Petr has submitted a v2 that appears to do just that. (Actually we're
already at v3, see 
http://www.spinics.net/lists/linux-kbuild/msg11840.html .)

I haven't looked at the patch too closely (until now I mostly helped
Petr with the boring stuff, like correct sign-off). Perhaps I find time
to have a close look at v3. Whatever happens, it's rather nice to notice
that Petr stopped (politely!) bugging me to finish my RFC patch and
submitted an updated version. I really appreciate that!


Paul Bolle
