Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46577 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752027AbaGQJ2S (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Jul 2014 05:28:18 -0400
Message-ID: <53C792D3.20705@suse.cz>
Date: Thu, 17 Jul 2014 11:09:39 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix compiler message generation
References: <20140702105645.17220.92338.stgit@warthog.procyon.org.uk> <20140702124016.GA26965@sepie.suse.cz> <53C6A509.5060809@plexistor.com>
In-Reply-To: <53C6A509.5060809@plexistor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Boaz Harrosh <boaz@plexistor.com>, David Howells <dhowells@redhat.com>
Cc: torvalds@linux-foundation.org, sam@ravnborg.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 2014-07-16 18:15, Boaz Harrosh wrote:
> This patch by itself works with kdevelop so I hope you did not submit my crap
> KBUILD_FULL_PATH patch at all and only added this one (and I know, the fix to this
> one with the -s)

Yes, I did not merge the KBUILD_FULL_PATH patch, because the approach
with the make message works out of the box.


> Also not that I like your patches because now I can compile the same directory
> from different machines with different absolute paths to the source and the
> compilation will come out the same. (before changed absolute path would cause
> a rebuild)

That's a nice side effect which I did not realize initially ;).

Michal
