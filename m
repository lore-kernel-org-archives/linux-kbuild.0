Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from benson.vm.bytemark.co.uk ([212.110.190.137]:59736 "EHLO
	benson.vm.bytemark.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752784AbaFBJjT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Jun 2014 05:39:19 -0400
Message-ID: <1401701956.15871.138.camel@hastur.hellion.org.uk>
Subject: Re: [PATCH] deb-pkg: Apply $(CROSS_COMPILE) when calling objcopy
From: Ian Campbell <ijc@hellion.org.uk>
Date: Mon, 02 Jun 2014 10:39:16 +0100
In-Reply-To: <CAGNsrLB+6Z12=ysQBd8AgvCaZCF+WRZ9T7S7WfAXa5Wapt8F1g@mail.gmail.com>
References: <1401691657-12222-1-git-send-email-ijc@hellion.org.uk>
	 <CAGNsrLB+6Z12=ysQBd8AgvCaZCF+WRZ9T7S7WfAXa5Wapt8F1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org

On Mon, 2014-06-02 at 12:29 +0300, Fathi Boudra wrote:
> I submitted it a month ago. It's already applied to kbuild.git#misc:
> http://www.spinics.net/lists/linux-kbuild/msg09273.html

I must have missed it, thanks!

Your version looks better (correctly uses $OBJCOPY)

Ian.


