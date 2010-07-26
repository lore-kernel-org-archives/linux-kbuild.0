Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:54282 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752909Ab0GZJ75 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Jul 2010 05:59:57 -0400
Message-ID: <4C4D5C7F.2030602@suse.cz>
Date: Mon, 26 Jul 2010 11:59:27 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: make randconfig fair for booleans
References: <1279801497-810-1-git-send-email-jacmet@sunsite.dk> <20100723211138.GA27379@merkur.ravnborg.org>
In-Reply-To: <20100723211138.GA27379@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Korsgaard <jacmet@sunsite.dk>, linux-kbuild@vger.kernel.org, zippel@linux-m68k.org

On 23.7.2010 23:11, Sam Ravnborg wrote:
> On Thu, Jul 22, 2010 at 02:24:57PM +0200, Peter Korsgaard wrote:
>> Give boolean symbols a 50% chance of getting enabled, rather than 67%.
>>
>> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> 
> Good catch!
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Michal - I assume you apply this for next merge window.

Yes, will do. I've been busy (again :)) for the last two weeks, so only
reviewed the few patches for .35.

Michal
