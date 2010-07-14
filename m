Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:35445 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751962Ab0GNQdR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Jul 2010 12:33:17 -0400
Message-ID: <4C3DE6C7.6040608@suse.cz>
Date: Wed, 14 Jul 2010 18:33:11 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] [RFC] implement size_append in perl
References: <1279116063-4499-1-git-send-email-virtuoso@slind.org> <4C3DCFB3.1090801@zytor.com> <20100714161201.GD23436@shisha.kicks-ass.net>
In-Reply-To: <20100714161201.GD23436@shisha.kicks-ass.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Shishkin <virtuoso@slind.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, =?ISO-8859-1?Q?Sebastian_Dalfu=DF?= <sd@sedf.de>, Oliver Hartkopp <oliver@hartkopp.net>, Michael Guntsche <mike@it-loops.com>, Jonathan Nieder <jrnieder@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>, Alek Du <alek.du@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <rmk@arm.linux.org.uk>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, linux-kernel@vger.kernel.org

On 07/14/2010 06:12 PM, Alexander Shishkin wrote:
> On Wed, Jul 14, 2010 at 07:54:43 -0700, H. Peter Anvin wrote:
>> On 07/14/2010 07:01 AM, Alexander Shishkin wrote:
>>> +size_append = $(PERL) -e 'print pack("V", (stat "$(lastword $1)")[7])'
>>
>> Why the "lastword"?
> 
> There's a whitespace right after it due to it being part of the target
> spec "$(obj)/piggy.$(suffix_y) FORCE", where "FORCE" is being filtered
> out.

Then you should use $(strip $1), which is more obvious IMO.

Michal
