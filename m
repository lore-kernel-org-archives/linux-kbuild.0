Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.186]:19835 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758280AbZACOKS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Jan 2009 09:10:18 -0500
Received: by ti-out-0910.google.com with SMTP id b6so9067637tic.23
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Jan 2009 06:10:15 -0800 (PST)
Message-ID: <df9815e70901030610w1c61d95bt8259e73c9609a8c3@mail.gmail.com>
Date: Sat, 3 Jan 2009 22:10:15 +0800
From: "Jike Song" <albcamus@gmail.com>
Subject: Re: [PATCH] Kbuild: reintroduce ALLSOURCE_ARCHS support for tags/cscope.
In-Reply-To: <20090102223414.GB8843@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1230730656-2987-1-git-send-email-albcamus@gmail.com>
	 <20090102223414.GB8843@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Sat, Jan 3, 2009 at 6:34 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Dec 31, 2008 at 09:37:36PM +0800, Jike Song wrote:
>> This patch reintroduce the ALLSOURCE_ARCHS support for tags/TAGS/
>> cscope targets. The Kbuild previously has this feature, but after
>> moving the targets into scripts/tags.sh, ALLSOURCE_ARCHS disappears.
>>
>> It's something like this:
>>
>>       $ make ALLSOURCE_ARCHS="x86 mips arm" tags cscope
>
>
> A second point...
> If you are serious about this then we need this documented
> somewhere. This is not "make help" material so I suggest you
> to add a new chapter in Documentation/kbuild/kbuild.txt
> where you could include this.

Excuse me, do you mean Documentation/kbuild/makefiles.txt instead?

-- 
Thanks,
Jike
