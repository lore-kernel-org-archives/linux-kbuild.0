Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cmta8.telus.net ([209.171.16.81]:41326 "EHLO cmta8.telus.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752555AbbIOTLh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Sep 2015 15:11:37 -0400
From: "Doug Smythies" <dsmythies@telus.net>
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org> <8737yfy24g.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8737yfy24g.fsf@kamboji.qca.qualcomm.com>
Subject: RE: [PATCH v2] builddeb: remove debian/files before build
Date: Tue, 15 Sep 2015 12:11:31 -0700
Message-ID: <001f01d0efea$56135e40$023a1ac0$@net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-ca
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Kalle Valo' <kvalo@codeaurora.org>, riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, ben@decadent.org.uk, Doug Smythies <dsmythies@telus.net>

On 2015.09.15 11:22 Kalle Valo wrote:
> <riku.voipio@linaro.org> writes:
>> From: Riku Voipio <riku.voipio@linaro.org>
>>
>> As debian/files keeps accumulating entries, the changes file
>> will end up growing indefinelty. Remove the file in clean
>> rule and before build starts.
>>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>> Reported-by: Doug Smythies <dsmythies@telus.net>

> Thanks, I had the same problem and this fixed it.
> Tested-by: Kalle Valo <kvalo@codeaurora.org>

I tested also. Thanks.

For an incremental compile, where only one source file
has changed, the time went from 7 minutes and 47 seconds
to 4 minutes and 33 seconds on my test server.
And the spew of warnings and such are gone.

For reference a clean compile typically takes about
23 minutes.

The overhead for making the .changes file is now on the
order of 2 to 4 seconds.

Obviously, results will vary widely for others, depending
on their hardware.


