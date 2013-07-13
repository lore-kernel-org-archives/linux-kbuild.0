Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:34014 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758125Ab3GMI4a (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Jul 2013 04:56:30 -0400
Date: Sat, 13 Jul 2013 10:56:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 6/9] kconf: gtk: move relayout code out of a loop
Message-ID: <20130713085627.GA32174@merkur.ravnborg.org>
References: <1372778550-22110-1-git-send-email-david.graeff@web.de> <1372778550-22110-7-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1372778550-22110-7-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: davidgraeff <david.graeff@web.de>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Tue, Jul 02, 2013 at 05:22:27PM +0200, davidgraeff wrote:
> ---
>  scripts/kconfig/gconfig/gconf.c                |    2 +
>  scripts/kconfig/gconfig/gconf_treeview_model.c |   10 +-

>  scripts/kconfig/qconfig/qconf.cc               | 1768 ------------------------
>  scripts/kconfig/qconfig/qconf.cpp              | 1768 ++++++++++++++++++++++++
That rename does not belong here...

	Sam

