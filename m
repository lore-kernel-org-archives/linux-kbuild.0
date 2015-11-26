Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:58664 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349AbbKZB3U (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2015 20:29:20 -0500
Date: Thu, 26 Nov 2015 01:28:59 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 2/2] ARM: Replace calls to __aeabi_{u}idiv with
 udiv/sdiv instructions
Message-ID: <20151126012859.GX8644@n2100.arm.linux.org.uk>
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
 <1448488264-23400-3-git-send-email-sboyd@codeaurora.org>
 <alpine.LFD.2.20.1511251733570.22569@knanqh.ubzr>
 <yw1x8u5lpqqz.fsf@unicorn.mansr.com>
 <alpine.LFD.2.20.1511251931050.22569@knanqh.ubzr>
 <yw1x4mg9posf.fsf@unicorn.mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yw1x4mg9posf.fsf@unicorn.mansr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Thu, Nov 26, 2015 at 12:50:08AM +0000, Måns Rullgård wrote:
> If not calling the function saves an I-cache miss, the benefit can be
> substantial.  No, I have no proof of this being a problem, but it's
> something that could happen.

That's a simplistic view of modern CPUs.

As I've already said, modern CPUs which have branch prediction, but
they also have speculative instruction fetching and speculative data
prefetching - which the CPUs which have idiv support will have.

With such features, the branch predictor is able to learn that the
branch will be taken, and because of the speculative instruction
fetching, it can bring the cache line in so that it has the
instructions it needs with minimal or, if working correctly,
without stalling the CPU pipeline.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
