Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:6174 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581Ab2HWUKF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Aug 2012 16:10:05 -0400
Message-ID: <1345752601.12440.3.camel@gandalf.local.home>
Subject: Re: [PATCH] kconfig: replace 'oldnoconfig' with 'olddefconfig',
 what it really does
From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 23 Aug 2012 16:10:01 -0400
In-Reply-To: <1345187778-19678-1-git-send-email-adam8157@gmail.com>
References: <1345187778-19678-1-git-send-email-adam8157@gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Lee <adam8157@gmail.com>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Yaakov Selkowitz <yselkowitz@users.sourceforge.net>, Peter Foley <pefoley2@verizon.net>, Paul Bolle <pebolle@tiscali.nl>, "Eric W. Biederman" <ebiederm@xmission.com>, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>

Sorry for the late reply.

On Fri, 2012-08-17 at 15:16 +0800, Adam Lee wrote:
> As 67d34a6a391369269a2e5dba8a5f42cc4cd50231 said, 'oldnoconfig' doesn't
> set new symbols to 'n', but instead sets it to their default values.
> 
> So, this patch replace 'oldnoconfig' with 'olddefconfig', stop making
> people confused.
> 
> PS: the document in conf.c fixed in another mail, "[PATCH] [Signed-off]
> kconfig: document oldnoconfig to what it really does in conf.c"

The reason that I didn't make this change myself is that I'm afraid that
things depend on 'oldnoconfig' existing. For example, ktest.pl has it
hardcoded. That may not be the only script that uses it.

I think a better solution would be to make oldnoconfig do just that, set
everything to 'n' as the name implies, and we can create a olddefconfig
to do what it does now.

-- Steve


> 
> Signed-off-by: Adam Lee <adam8157@gmail.com>
> ---
>  scripts/kconfig/Makefile     |  6 +++---
>  scripts/kconfig/conf.c       | 18 +++++++++---------
>  tools/testing/ktest/ktest.pl | 15 +++++++--------
>  3 files changed, 19 insertions(+), 20 deletions(-)
> 


