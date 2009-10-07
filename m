Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from webmail10.mail.sp.isp-net.nl ([217.149.192.62]:35656 "EHLO
	webmail10.mail.sp.isp-net.nl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934167AbZJGImb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Oct 2009 04:42:31 -0400
Date: Wed, 7 Oct 2009 10:41:35 +0200
From: Dick Streefland <dick@streefland.net>
Subject: Re: [PATCH] kconfig: simplification of scripts/extract-ikconfig
Message-ID: <20091007084135.GA5355@streefland.net>
References: <20091006203540.GA14634@streefland.net> <1254881503.1696.115.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1254881503.1696.115.camel@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On Tuesday 2009-10-06 22:11, Steven Rostedt wrote:
| Now the question is, is this something that we should try to get into
| the 32 release, or let this version go through linux-next for another
| release?

I don't have a strong preference, as long as it gets into the kernel
tree in the end. I realize that it is a bit late in the 32 release
cycle, but on the other hand this script is not used in the kernel
build process.

-- 
Dick
