Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33095 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751842Ab1KTM4u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Nov 2011 07:56:50 -0500
Message-ID: <4EC8F907.4060906@suse.cz>
Date: Sun, 20 Nov 2011 13:56:39 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
References: <1321567131.25715.32.camel@work-vm>
In-Reply-To: <1321567131.25715.32.camel@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: john stultz <johnstul@us.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, linux-kbuild@vger.kernel.org

On 17.11.2011 22:58, john stultz wrote:
> Hey Andrew, 
> 	I've tried sending this via Michal a few times, but haven't heard much
> back. So I wanted to check if you would consider merging it via your
> tree, or if you had any suggestions of who would be better to
> review/merge this.

My concern was that the script works around missing features in kconfig,
instead of fixing kconfig. Don't get me wrong, I do believe that the
script is useful, but if you are submitting to mainline anyway, why
don't you fix/enhance kconfig in mainline and have a much simpler script
making use of the enhanced kconfig?

Michal
