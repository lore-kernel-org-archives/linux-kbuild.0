Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0023.hostedemail.com ([216.40.44.23]:35696 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750931AbbLAQ4G (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Dec 2015 11:56:06 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 74DE8173085
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2015 16:49:34 +0000 (UTC)
Date: Tue, 1 Dec 2015 11:49:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 1/2] scripts: Add a recorduidiv program
Message-ID: <20151201114929.655433a2@gandalf.local.home>
In-Reply-To: <20151201161944.GX8644@n2100.arm.linux.org.uk>
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
	<1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
	<20151125234711.GT8644@n2100.arm.linux.org.uk>
	<565C6714.802@suse.com>
	<20151130153208.GR8644@n2100.arm.linux.org.uk>
	<565C6DE9.2020302@suse.com>
	<565DC5A9.2010305@suse.cz>
	<20151201161944.GX8644@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>

On Tue, 1 Dec 2015 16:19:44 +0000
Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
 
> They hardly "do nothing", as the (eg) recordmcount plasters the build
> log with warnings.  A solution to that would be to make recordmcount
> silent if the section is already present.

Note, that warning found plenty of bugs when modifications of the build
system was being done and broke recordmcount.c. I really don't want to
silent it.

But for some reason, your build is causing lots of warnings and not for
others. Perhaps we can add a "SILENT_RECORDMCOUNT" environment variable
and have it set when something like CCACHE_HARDLINK or whatever is
causing it to trigger when we don't care.

-- Steve

