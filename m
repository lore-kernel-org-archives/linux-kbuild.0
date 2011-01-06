Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from antcom.de ([188.40.178.216]:53177 "EHLO chuck.antcom.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752864Ab1AFX2h (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Jan 2011 18:28:37 -0500
Message-ID: <4D265022.5020700@antcom.de>
Date: Fri, 07 Jan 2011 00:28:34 +0100
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
Subject: Re: Kernel build ignores missing mkimage on building uImage
References: <4D0B8D85.5090605@antcom.de> <20110106135558.GC1841@sepie.suse.cz>
In-Reply-To: <20110106135558.GC1841@sepie.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 06/01/11 14:55, Michal Marek wrote:
>> I.e. it says: "uImage is ready" even though the uImage file doesn't
>> exist because mkimage is missing.
>>
>> (I'm working with Linux' current mainline GIT and also see that the
>> problem is also present in the mmarek repo on git.kernel.org.)
>>
>> I propose the attached patch.
>>
>> Thanks for considering.
> 
> The patch makes sense and afaics none of the architectures relies on
> this behaviour (either they can't work without mkimage, or a
> uimage-style target has to be requested by the user). Can I assume
> "Signed-off-by: Roland Stigge <stigge@antcom.de>" on this patch.

Yes!

Thanks,

Roland
