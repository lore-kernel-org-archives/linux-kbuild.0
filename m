Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:55971 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751628AbdI0VG2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Sep 2017 17:06:28 -0400
Subject: Wrong -dirty suffix set by setlocalversion (was: BUG in git
 diff-index)
From: Marc Herbert <Marc.Herbert@intel.com>
References: <loom.20160331T143733-916@post.gmane.org>
 <20160331140515.GA31116@sigill.intra.peff.net>
 <CAJxkE8SVF_ikHqDCh6eHExq=seitHPVpxW2GmPo40jtqWvz1JQ@mail.gmail.com>
 <20160331142704.GC31116@sigill.intra.peff.net> <56FD7AE8.4090905@nglowry.com>
 <xmqqwpoil6vt.fsf@gitster.mtv.corp.google.com>
 <d9b4725b-3204-03af-1bc2-6469bb815c63@intel.com>
Message-ID: <89d82c84-7a3b-9c4c-679e-a7a723669592@intel.com>
Date: Wed, 27 Sep 2017 14:06:24 -0700
MIME-Version: 1.0
In-Reply-To: <d9b4725b-3204-03af-1bc2-6469bb815c63@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Junio C Hamano <gitster@pobox.com>, Andy Lowry <andy.work@nglowry.com>
Cc: Jeff King <peff@peff.net>, git <git@vger.kernel.org>, Christian Kujau <lists@nerdbynature.de>, josh@joshtriplett.org, michael.w.mason@intel.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

+ linux-kbuild list which is not in the output of:
  ./scripts/get_maintainer.pl -f scripts/setlocalversion 
... but seems relevant anyway.

On 31/03/16 13:39, Junio C Hamano wrote:
> Andy Lowry <andy.work@nglowry.com> writes:
> 
>> So I think now that the script should do "update-index --refresh"
>> followed by "diff-index --quiet HEAD". Sound correct?
> 
> Yes.  That has always been one of the kosher ways for any script to
> make sure that the files in the working tree that are tracked have
> not been modified relative to HEAD (assuming that the index matches
> HEAD).  

Too bad kernel/scripts/setlocalversion didn't get the memo:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cdf2bc632ebc9ef51
> scripts/setlocalversion on write-protected source tree (2013)
> I don't see how removing "git update-index" could do any harm.

This causes a spurious "-dirty" suffix when building from a directory copy
(as Mike learned the hard way)

[...]

https://public-inbox.org/git/1459432667.2124.2.camel@dwim.me 
