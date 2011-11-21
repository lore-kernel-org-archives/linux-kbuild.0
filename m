Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e37.co.us.ibm.com ([32.97.110.158]:45952 "EHLO
	e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749Ab1KUWsb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 17:48:31 -0500
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <johnstul@us.ibm.com>;
	Mon, 21 Nov 2011 15:48:31 -0700
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id pALMmRhF052394
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 15:48:27 -0700
Received: from d03av05.boulder.ibm.com (loopback [127.0.0.1])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id pALMmD5J006124
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 15:48:17 -0700
Message-ID: <1321915691.6445.29.camel@work-vm>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: john stultz <johnstul@us.ibm.com>
Date: Mon, 21 Nov 2011 14:48:11 -0800
In-Reply-To: <1321685490-11706-1-git-send-email-lacombar@gmail.com>
References: <1321567131.25715.32.camel@work-vm>
	 <1321685490-11706-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, 2011-11-19 at 01:51 -0500, Arnaud Lacombe wrote:
> You'll find below some more nits
> 
> 1) bail out early on error.

Actually, I spoke a little too soon.

The set -e option causes us to bomb out if grep doesn't find a config
option (grep returns 1 if nothing is found). So I'll have to drop that
change for now.

thanks
-john


