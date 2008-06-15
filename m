Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lazybastard.de ([212.112.238.170]:60258 "EHLO
	longford.logfs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758689AbYFOR6s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Jun 2008 13:58:48 -0400
Date: Sun, 15 Jun 2008 19:58:35 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Not as much ccache win as I expected
Message-ID: <20080615175835.GA15244@logfs.org>
References: <4852C51D.30206@am.sony.com> <8499950a0806131354u7d2431b2n2df50b7b6c98f18d@mail.gmail.com> <4852E245.4020502@am.sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4852E245.4020502@am.sony.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tim Bird <tim.bird@am.sony.com>
Cc: Oleg Verych <olecom@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Fri, 13 June 2008 14:10:29 -0700, Tim Bird wrote:
> 
> Maybe I should just be grateful for any ccache hits I get.

ccache's usefulness depends on your workload.  If you make a change to
include/linux/fs.h, close to 100% of the kernel is rebuilt, with or
without ccache.  But when you revert that change, the build time differs
dramatically.  Without ccache, fs.h was simply changed again and
everything is rebuild.  With ccache, there are hits for the old version
and all is pulled from the cache - provided you have allotted enough
disk for it.

If you never revert to an old version or do some equivalent operation,
ccache can even be a net loss.  On a fast machine, the additional disk
accesses are easily more expensive than the minimal cpu gains.

Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
