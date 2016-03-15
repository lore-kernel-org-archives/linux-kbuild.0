Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51562 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752416AbcCOVjh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2016 17:39:37 -0400
Subject: Re: [PATCH] kbuild: Add option to turn incompatible pointer check
 into error
References: <1457425749-24110-1-git-send-email-wagi@monom.org>
 <alpine.DEB.2.11.1603081010000.6083@nanos> <20160308091941.GD12413@gmail.com>
 <56E88003.3050708@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56E88116.70803@suse.cz>
Date: Tue, 15 Mar 2016 22:39:34 +0100
MIME-Version: 1.0
In-Reply-To: <56E88003.3050708@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Daniel Wagner <wagi@monom.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>

Dne 15.3.2016 v 22:34 Michal Marek napsal(a):
> Dne 8.3.2016 v 10:19 Ingo Molnar napsal(a):
>> Note that there will be a few build failures triggered by this, for example this 
>> fix from linux-next is needed:
>>
>>> commit db9b60400f9253c25ae639797df2d0ff7a35d9d8
>>> Author: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>>> Date:   Tue Feb 2 11:35:55 2016 +0530
>>>
>>>     drm/gma500: remove helper function
> 
> OK. I will send a pull request to Linus only after at least
> x86_64/allyescofnig is fixed.

... which, incidentally, the gma500 file is not part of :).

Michal
