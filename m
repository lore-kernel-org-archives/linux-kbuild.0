Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:33190 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbbJEMjm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Oct 2015 08:39:42 -0400
Received: by wiclk2 with SMTP id lk2so118308749wic.0
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2015 05:39:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <002801d0ff09$a23930f0$e6ab92d0$@net>
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
	<1442858954.3511.1.camel@decadent.org.uk>
	<87oagun1ax.fsf@kamboji.qca.qualcomm.com>
	<002801d0ff09$a23930f0$e6ab92d0$@net>
Date: Mon, 5 Oct 2015 15:39:40 +0300
Message-ID: <CAAqcGHk28JMuMhp=yTuzTvS6OeVKX8wCR7SW1xFG21vA=t+YQg@mail.gmail.com>
Subject: Re: [PATCH v2] builddeb: remove debian/files before build
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mmarek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Ben Hutchings <ben@decadent.org.uk>, Doug Smythies <dsmythies@telus.net>

On 5 October 2015 at 04:03, Doug Smythies <dsmythies@telus.net> wrote:
> On 2015.09.22 04:25 Kalle Valo wrote:
>> Ben Hutchings <ben@decadent.org.uk> writes:
>>> On Tue, 2015-09-15 at 21:11 +0300, riku.voipio@linaro.org wrote:
>>>> From: Riku Voipio <riku.voipio@linaro.org>
>>>>
>>>> As debian/files keeps accumulating entries, the changes file
>>>> will end up growing indefinelty. Remove the file in clean
>>>> rule and before build starts.
>>>>
>>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>>> Reported-by: Doug Smythies <dsmythies@telus.net>
>>> [...]
>>>
>>> FWIW:
>>>
>>> Acked-by: Ben Hutchings <ben@decadent.org.uk>
>>
>> Marek, this is a pretty annoying regression. Is it possible to get this
>> to 4.3?
>
> Perhaps I do not understand the process here, but having reported the issue
> within a day of kernel 4.3-rc1 being released, and then what seems to be an
> acceptable patch being suggested, and tested, with plenty of time to make
> into -rc2, why hasn't it been included yet (-rc4)?

Hi Andrew,

Could you pass this patch in your series, as the regression doesn't
seem to be getting through via the maintainer. It would be
embarrassing to have it in 4.3 since it was reported and fixed timely.
The  patch is at:

http://permalink.gmane.org/gmane.linux.kbuild.devel/13710

Tests and acks at:

http://comments.gmane.org/gmane.linux.kbuild.devel/13710


Riku
