Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47192 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752379AbbJZVgl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 17:36:41 -0400
Subject: Re: [PATCH v3] deb-pkg: Add automatic support for armhf architecture
References: <1443404080.2517.30.camel@decadent.org.uk>
 <CAAqcGHnhF1CbaX5j=MedNybM_2hc-31q7w+JDDUFyFFU1URFxw@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <562E9CE6.9080809@suse.cz>
Date: Mon, 26 Oct 2015 22:36:38 +0100
MIME-Version: 1.0
In-Reply-To: <CAAqcGHnhF1CbaX5j=MedNybM_2hc-31q7w+JDDUFyFFU1URFxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, debian-arm@lists.debian.org, Ian Campbell <ijc@hellion.org.uk>

Dne 22.10.2015 v 12:28 Riku Voipio napsal(a):
> On 28 September 2015 at 04:34, Ben Hutchings <ben@decadent.org.uk> wrote:
>> The Debian armhf architecture uses the ARM EABI hard-float variant,
>> whereas armel uses the soft-float variant.  Although the kernel
>> doesn't use FP itself, CONFIG_VFP must be enabled to support
>> hard-float userland and will probably be disabled when supporting a
>> soft-float userland.  So set the architecture to armhf by default when
>> CONFIG_AEABI and CONFIG_VFP are both enabled.
>>
>> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>> Acked-by: Ian Campbell <ijc@hellion.org.uk>
>> Acked-by: Fathi Boudra <fathi.boudra@linaro.org>
> 
> Reviewed-by: Riku Voipio <riku.voipio@linaro.org>

Applied to kbuild.git#misc.

Michal

