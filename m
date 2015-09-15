Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:53316 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601AbbIOSV5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Sep 2015 14:21:57 -0400
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] builddeb: remove debian/files before build
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
Date: Tue, 15 Sep 2015 21:21:51 +0300
Message-ID: <8737yfy24g.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, ben@decadent.org.uk, dsmythies@telus.net

<riku.voipio@linaro.org> writes:

> From: Riku Voipio <riku.voipio@linaro.org>
>
> As debian/files keeps accumulating entries, the changes file
> will end up growing indefinelty. Remove the file in clean
> rule and before build starts.
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> Reported-by: Doug Smythies <dsmythies@telus.net>

Thanks, I had the same problem and this fixed it.

Tested-by: Kalle Valo <kvalo@codeaurora.org>

But it would be nice to have a fixes line to point out what commit this
fixes:

Fixes: 3716001bcb7f ("deb-pkg: add source package")

-- 
Kalle Valo
