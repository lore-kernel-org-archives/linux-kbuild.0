Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:43903 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752114Ab0AGLUA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2010 06:20:00 -0500
Message-ID: <4B45C35E.4080506@suse.cz>
Date: Thu, 07 Jan 2010 12:19:58 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Don't mkdir -p include/config in the sourcetree when
 	using O=outputdir option
References: <alpine.LFD.2.00.1001061705140.3744@localhost.localdomain>	 <4B44E5C8.2050006@suse.cz>	 <520f0cf11001061210w4d33fca6y98f091c4260577c0@mail.gmail.com>	 <4B44F665.6050008@suse.cz> <520f0cf11001061430l2b363d90qce43bf94a384cf13@mail.gmail.com>
In-Reply-To: <520f0cf11001061430l2b363d90qce43bf94a384cf13@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Kacur <jkacur@redhat.com>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On 6.1.2010 23:30, John Kacur wrote:
> On Wed, Jan 6, 2010 at 9:45 PM, Michal Marek <mmarek@suse.cz> wrote:
> Michal: The length of time that a bug exists in a piece of code is no
> argument for
> it's correctness!

From your original post I though it fails reliably for you. If it's a
race, then you're right, the time it was introduced is irrelevant :-).


> I tried to debug this using
> make -d V=1 O=/bld/2.6.33-rc3
> and discovered that the bug did not always occur, but did sometimes.
> This leads me to think that it is timing sensitive, and indeed the
> problem shows up
> more easily on a machine with multiple processors.
> 
> Is it possible that the step with mkdir -p can sometimes occur in a
> Makefile parallel process
> before the cd KBUILD_OUTPUT occurs? That would explain why it doesn't
> reliably reproduce.

OK, I still don't see how it fails, but adding $(objtree) there is a
valid change and if it fixes your problem, let's apply it.

Michal
