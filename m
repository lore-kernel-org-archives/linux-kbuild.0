Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55458 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752894Ab3IATgc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 1 Sep 2013 15:36:32 -0400
Message-ID: <5223973A.2070603@suse.cz>
Date: Sun, 01 Sep 2013 21:36:26 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] diffconfig: Update script to support python versions
 2.5 through 3.3
References: <20130820184112.GA18525@woodpecker.gentoo.org> <20130828115706.GA17212@woodpecker.gentoo.org> <5220B236.1040009@suse.cz> <20130830194145.GA6522@woodpecker.gentoo.org>
In-Reply-To: <20130830194145.GA6522@woodpecker.gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

Dne 30.8.2013 21:41, Mike Pagano napsal(a):
> On Fri, Aug 30, 2013 at 04:54:46PM +0200, Michal Marek wrote:
>> On 28.8.2013 13:57, Mike Pagano wrote:
>>> On Tue, Aug 20, 2013 at 02:41:12PM -0400, Mike Pagano wrote:
>>>> Support past and active versions of python while maintaining backward compatibility.
>>> Any feedback or thoughts on this patch?
>>
>> Sorry for the delay. It works great, even with 2.4. You just forgot to
>> add your signoff, can I add
>>
>> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
>>
>> ?
>>
> Yes, sorry about that and thanks for taking the time to look at it.

OK, pushed to kbuild.git#kconfig.

Michal

