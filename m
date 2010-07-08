Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47419 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750810Ab0GHFrX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Jul 2010 01:47:23 -0400
Message-ID: <4C356669.6020700@suse.cz>
Date: Thu, 08 Jul 2010 07:47:21 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [GIT] kbuild
References: <20100707090808.GA23006@sepie.suse.cz> <AANLkTimWtisN1J3EBKcckQ6Ex6jCbfyVcZfeAYYIXmHy@mail.gmail.com>
In-Reply-To: <AANLkTimWtisN1J3EBKcckQ6Ex6jCbfyVcZfeAYYIXmHy@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 7.7.2010 18:41, Linus Torvalds wrote:
> On Wed, Jul 7, 2010 at 2:08 AM, Michal Marek <mmarek@suse.cz> wrote:
>> my last pull request broke LOCALVERSION for O=... builds, sorry about
>> that. The following commit fixes that (verified by Rafael and Stephen
>> who reported it. I really hope this is the _last_ kbuild thing for
>> 2.6.35.
> 
> Hmm. I already applied the patch you sent earlier. It's commit
> 7263e715c91f in my tree.

Ok, thanks. I didn't notice that the patch is already in your tree.

Michal
