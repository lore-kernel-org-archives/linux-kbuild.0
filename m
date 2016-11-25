Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38254 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753947AbcKYOWZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Nov 2016 09:22:25 -0500
Subject: Re: [PATCH 6/6] deb-pkg: Remove the KBUILD_IMAGE workaround
References: <20161122213434.14788-1-mmarek@suse.com>
 <20161122213434.14788-6-mmarek@suse.com>
 <CAAqcGHmnGFgCjmsjerecy2Jf0YaCThGp5TxS1yNXqGzZnsXLBQ@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5dd95503-9782-6c9a-a6ac-6067eed1935e@suse.com>
Date: Fri, 25 Nov 2016 15:22:22 +0100
MIME-Version: 1.0
In-Reply-To: <CAAqcGHmnGFgCjmsjerecy2Jf0YaCThGp5TxS1yNXqGzZnsXLBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Dne 25.11.2016 v 13:12 Riku Voipio napsal(a):
> On 22 November 2016 at 23:34, Michal Marek <mmarek@suse.com> wrote:
>> The arch Makefile are fixed to set KBUILD_IMAGE to the full patch, so
>> the workaround is no longer needed.
>>
>> Signed-off-by: Michal Marek <mmarek@suse.com>
>> ---
> Thanks for cleaning this up.
> 
> Reviewed-by: Riku Voipio <riku.voipio@linaro.org>

Note that this will only be merged once the individual arch patches have
been picked up.

Michal
