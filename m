Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:34285 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751498AbYAYDU2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 22:20:28 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
Date: Fri, 25 Jan 2008 14:19:09 +1100
References: <20080124215813.GA4204@uranus.ravnborg.org> <1201212238-4369-12-git-send-email-sam@ravnborg.org>
In-Reply-To: <1201212238-4369-12-git-send-email-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200801251419.09999.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Tejun Heo <htejun@gmail.com>, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>, Jon Masters <jonathan@jonmasters.org>

On Friday 25 January 2008 09:02:53 Sam Ravnborg wrote:
> From: Tejun Heo <htejun@gmail.com>
>
> When driver modules are loaded by udev, what comes first in
> modules.alias file is selected.

Actually, I had occasion to look at this the other day, and in the modprobe 
version here every match is selected.  And they'll be loaded in reverse order 
of the module.alias file.

Looks like Jon's latest git tree does the same.

So, what does this patch actually fix?

Confused,
Rusty.
