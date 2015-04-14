Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from purkki.adurom.net ([80.68.90.206]:60488 "EHLO purkki.adurom.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751179AbbDNGw5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Apr 2015 02:52:57 -0400
From: Kalle Valo <kvalo@adurom.com>
Subject: Re: [PATCH] Use -mcount-record for dynamic ftrace
References: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
	<20150413153212.131fabc1@gandalf.local.home>
Date: Tue, 14 Apr 2015 09:19:58 +0300
In-Reply-To: <20150413153212.131fabc1@gandalf.local.home> (Steven Rostedt's
	message of "Mon, 13 Apr 2015 15:32:12 -0400")
Message-ID: <878udv6xkh.fsf@purkki.adurom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

Steven Rostedt <rostedt@goodmis.org> writes:

> I wonder who's responsible for
> https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/
>
> If they can add a i386/x86_64 build for gcc5 I'll be happy to download
> it and test this patch.

Found this:

"For any questions don't hesitate to contact me at tony (at) bake your
noodle . com"

https://www.kernel.org/pub/tools/crosstool/

-- 
Kalle Valo
