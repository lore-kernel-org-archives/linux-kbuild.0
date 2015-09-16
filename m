Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:33610 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739AbbIPGzG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Sep 2015 02:55:06 -0400
Received: by wiclk2 with SMTP id lk2so58379644wic.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2015 23:55:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <001f01d0efea$56135e40$023a1ac0$@net>
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
	<8737yfy24g.fsf@kamboji.qca.qualcomm.com>
	<001f01d0efea$56135e40$023a1ac0$@net>
Date: Wed, 16 Sep 2015 09:55:05 +0300
Message-ID: <CAAqcGHm+BNX4NHazXozmUdCW5yNjd4nQ0BV1oU71eQLDVtQTXw@mail.gmail.com>
Subject: Re: [PATCH v2] builddeb: remove debian/files before build
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Smythies <dsmythies@telus.net>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>

On 15 September 2015 at 22:11, Doug Smythies <dsmythies@telus.net> wrote:
> On 2015.09.15 11:22 Kalle Valo wrote:
>> <riku.voipio@linaro.org> writes:
>>> From: Riku Voipio <riku.voipio@linaro.org>
>>>
>>> As debian/files keeps accumulating entries, the changes file
>>> will end up growing indefinelty. Remove the file in clean
>>> rule and before build starts.
>>>
>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>> Reported-by: Doug Smythies <dsmythies@telus.net>

>> Thanks, I had the same problem and this fixed it.
>> Tested-by: Kalle Valo <kvalo@codeaurora.org>

> I tested also. Thanks.

Michal, can you get this as fix for 4.3, since this is a regression?

Riku

> For an incremental compile, where only one source file
> has changed, the time went from 7 minutes and 47 seconds
> to 4 minutes and 33 seconds on my test server.
> And the spew of warnings and such are gone.
>
> For reference a clean compile typically takes about
> 23 minutes.
>
> The overhead for making the .changes file is now on the
> order of 2 to 4 seconds.
>
> Obviously, results will vary widely for others, depending
> on their hardware.
>
>
