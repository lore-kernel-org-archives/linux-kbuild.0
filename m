Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:45647 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751223Ab0KINxz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Nov 2010 08:53:55 -0500
Subject: Re: [v2 PATCH] ftrace: Speed up recordmcount
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <AANLkTimS7YsZo+AGyTJq+G4kqsviRMRbdgt3NqZgEUws@mail.gmail.com>
References: <3dc8cddf022eb7024f9f2cf857529a15bee8999a.1288196498.git.wuzhangjin@gmail.com>
	 <4CC9E5B5.5040402@suse.cz>
	 <AANLkTimS7YsZo+AGyTJq+G4kqsviRMRbdgt3NqZgEUws@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 09 Nov 2010 08:53:52 -0500
Message-ID: <1289310832.12418.88.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: wu zhangjin <wuzhangjin@gmail.com>
Cc: linux-kernel@vger.kernel.org, mingo@elte.hu, John Reiser <jreiser@bitwagon.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Tue, 2010-11-09 at 13:35 +0800, wu zhangjin wrote:

> Did you apply this patch, should I fix this typo and resend it to you?

I applied it, but during testing it triggered a bug in the build system.

I'm looking into it. It is not really related to this patch, but I can't
submit it till the build is fix.

Also, since it is not that critical of a patch, I think I'll queue it
for 2.6.38, just to be safe.

Thanks,

-- Steve


