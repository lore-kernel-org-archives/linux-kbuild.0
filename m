Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0240.hostedemail.com ([216.40.44.240]:42420 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752843AbbDNNHU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Apr 2015 09:07:20 -0400
Date: Tue, 14 Apr 2015 09:07:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] Use -mcount-record for dynamic ftrace
Message-ID: <20150414090717.10d54ce6@gandalf.local.home>
In-Reply-To: <878udv6xkh.fsf@purkki.adurom.net>
References: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
	<20150413153212.131fabc1@gandalf.local.home>
	<878udv6xkh.fsf@purkki.adurom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kalle Valo <kvalo@adurom.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

On Tue, 14 Apr 2015 09:19:58 +0300
Kalle Valo <kvalo@adurom.com> wrote:

> Steven Rostedt <rostedt@goodmis.org> writes:
> 
> > I wonder who's responsible for
> > https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/
> >
> > If they can add a i386/x86_64 build for gcc5 I'll be happy to download
> > it and test this patch.
> 
> Found this:
> 
> "For any questions don't hesitate to contact me at tony (at) bake your
> noodle . com"
> 
> https://www.kernel.org/pub/tools/crosstool/
> 

Thanks for the pointer.

-- Steve
