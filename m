Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57467 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751460AbbKBNjU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Nov 2015 08:39:20 -0500
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
References: <20151102035340.17310681@canb.auug.org.au>
 <5636D465.4060104@infradead.org>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56376784.3030804@suse.cz>
Date: Mon, 2 Nov 2015 14:39:16 +0100
MIME-Version: 1.0
In-Reply-To: <5636D465.4060104@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>, Thiago Macieira <thiago.macieira@intel.com>

On 2015-11-02 04:11, Randy Dunlap wrote:
> On 11/01/15 08:53, Stephen Rothwell wrote:
>> Hi all,
>>
>> I start again a day early, and this is how you all repay me? ;-)
>>
>> Changes since 20151022:
>>
> 
> on x86_64:
> 
> 'make xconfig' dies a quick death when I try to use it:
> 
> linux-next-20151101> ASSERT: "!isEmpty()" in file /usr/include/QtCore/qlist.h, line 282

Added Boris and Thiago to Cc.

Are you using Qt4 or Qt5? An

  ldd scripts/kconfig/qconf | grep Qt

will tell you.

Michal
