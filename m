Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:41315 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753022AbZKLPQp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Nov 2009 10:16:45 -0500
Subject: Re: [PATCH v2] add userspace API headfile for net hardware
 time-stamp to kbuild
From: Patrick Ohly <patrick.ohly@gmx.de>
In-Reply-To: <1258019996-8880-1-git-send-email-21cnbao@gmail.com>
References: <1258019996-8880-1-git-send-email-21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Nov 2009 16:16:46 +0100
Message-ID: <1258039006.10137.639.camel@pohly-mobl1.ikn.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org, Jie Zhang <jie.zhang@analog.com>, Barry Song <barry.song@analog.com>

On Thu, 2009-11-12 at 17:59 +0800, Barry Song wrote:
> From: Jie Zhang <jie.zhang@analog.com>
> 
> include/linux/net_tstamp.h is userspace API for hardware time stamping
> of network packets. It should be exported to userspace.
> 
> Signed-off-by: Jie Zhang <jie.zhang@analog.com>
> Signed-off-by: Barry Song <barry.song@analog.com>
> cc: Patrick Ohly <patrick.ohly@gmx.de>

Looks right to me. Not exporting it was oversight. Thanks for pointing
this out.

Signed-off-by: Patrick Ohly <patrick.ohly@gmx.de>

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


