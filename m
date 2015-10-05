Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cmta2.telus.net ([209.171.16.75]:39208 "EHLO cmta2.telus.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751153AbbJEBD1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 Oct 2015 21:03:27 -0400
From: "Doug Smythies" <dsmythies@telus.net>
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>	<1442858954.3511.1.camel@decadent.org.uk> <87oagun1ax.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87oagun1ax.fsf@kamboji.qca.qualcomm.com>
Subject: RE: [PATCH v2] builddeb: remove debian/files before build
Date: Sun, 4 Oct 2015 18:03:20 -0700
Message-ID: <002801d0ff09$a23930f0$e6ab92d0$@net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-ca
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, 'Kalle Valo' <kvalo@codeaurora.org>, 'Ben Hutchings' <ben@decadent.org.uk>, Doug Smythies <dsmythies@telus.net>

On 2015.09.22 04:25 Kalle Valo wrote:
> Ben Hutchings <ben@decadent.org.uk> writes:
>> On Tue, 2015-09-15 at 21:11 +0300, riku.voipio@linaro.org wrote:
>>> From: Riku Voipio <riku.voipio@linaro.org>
>>> 
>>> As debian/files keeps accumulating entries, the changes file
>>> will end up growing indefinelty. Remove the file in clean
>>> rule and before build starts.
>>> 
>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>> Reported-by: Doug Smythies <dsmythies@telus.net>
>> [...]
>>
>> FWIW:
>>
>> Acked-by: Ben Hutchings <ben@decadent.org.uk>
>
> Marek, this is a pretty annoying regression. Is it possible to get this
> to 4.3?

Perhaps I do not understand the process here, but having reported the issue
within a day of kernel 4.3-rc1 being released, and then what seems to be an
acceptable patch being suggested, and tested, with plenty of time to make
into -rc2, why hasn't it been included yet (-rc4)?


