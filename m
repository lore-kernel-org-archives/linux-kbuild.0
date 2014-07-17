Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:63257 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754819AbaGQKLc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Jul 2014 06:11:32 -0400
Received: by mail-wi0-f180.google.com with SMTP id n3so2815543wiv.7
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Jul 2014 03:11:29 -0700 (PDT)
Message-ID: <53C79B85.20805@plexistor.com>
Date: Thu, 17 Jul 2014 12:46:45 +0300
From: Boaz Harrosh <boaz@plexistor.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix compiler message generation
References: <20140702105645.17220.92338.stgit@warthog.procyon.org.uk> <20140702124016.GA26965@sepie.suse.cz> <53C6A509.5060809@plexistor.com> <53C792D3.20705@suse.cz>
In-Reply-To: <53C792D3.20705@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 07/17/2014 12:09 PM, Michal Marek wrote:
> On 2014-07-16 18:15, Boaz Harrosh wrote:
>> This patch by itself works with kdevelop so I hope you did not submit my crap
>> KBUILD_FULL_PATH patch at all and only added this one (and I know, the fix to this
>> one with the -s)
> 
> Yes, I did not merge the KBUILD_FULL_PATH patch, because the approach
> with the make message works out of the box.
> 
> 
>> Also not that I like your patches because now I can compile the same directory
>> from different machines with different absolute paths to the source and the
>> compilation will come out the same. (before changed absolute path would cause
>> a rebuild)
> 

Rrrr I hope you understood that not => Note above. I *do* like your patch a lot

> That's a nice side effect which I did not realize initially ;).
> 

I guess this is everywhere that has __FILE__ in code needs to be rebuilt
So it is more in debug builds than ndebug.

> Michal
> 

Ye cool thanks, all is well
Boaz

