Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:48203 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301AbbIVLZe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 07:25:34 -0400
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] builddeb: remove debian/files before build
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
	<1442858954.3511.1.camel@decadent.org.uk>
Date: Tue, 22 Sep 2015 14:25:26 +0300
Message-ID: <87oagun1ax.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, dsmythies@telus.net

Ben Hutchings <ben@decadent.org.uk> writes:

> On Tue, 2015-09-15 at 21:11 +0300, riku.voipio@linaro.org wrote:
>> From: Riku Voipio <riku.voipio@linaro.org>
>> 
>> As debian/files keeps accumulating entries, the changes file
>> will end up growing indefinelty. Remove the file in clean
>> rule and before build starts.
>> 
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>> Reported-by: Doug Smythies <dsmythies@telus.net>
> [...]
>
> FWIW:
>
> Acked-by: Ben Hutchings <ben@decadent.org.uk>

Marek, this is a pretty annoying regression. Is it possible to get this
to 4.3?

-- 
Kalle Valo
