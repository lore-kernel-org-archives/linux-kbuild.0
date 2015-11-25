Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:58453 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbbKYXrZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2015 18:47:25 -0500
Date: Wed, 25 Nov 2015 23:47:11 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/2] scripts: Add a recorduidiv program
Message-ID: <20151125234711.GT8644@n2100.arm.linux.org.uk>
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
 <1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>, Michal Marek <mmarek@suse.com>

On Wed, Nov 25, 2015 at 01:51:03PM -0800, Stephen Boyd wrote:
> The ARM compiler inserts calls to __aeabi_uidiv() and
> __aeabi_idiv() when it needs to perform division on signed and
> unsigned integers. If a processor has support for the udiv and
> sdiv division instructions the calls to these support routines
> can be replaced with those instructions. Therefore, record the
> location of calls to these library functions into two sections
> (one for udiv and one for sdiv) similar to how we trace calls to
> mcount. When the kernel boots up it will check to see if the
> processor supports the instructions and then patch the call sites
> with the instruction.

Do we have any resolution on these programs which modify the object
files in-place, rather than breaking any hard-links which may be
present (eg, as a result of using ccache in hard-link mode) ?

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
