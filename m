Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:56233 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759630AbYB2UFq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Feb 2008 15:05:46 -0500
Date: Fri, 29 Feb 2008 21:05:17 +0100
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/3] fix recursive dependencies
Message-ID: <20080229200517.GE21494@elte.hu>
References: <200802210258.45011.yinghai.lu@sun.com> <200802241832.37850.yinghai.lu@sun.com> <200802242136.28744.yinghai.lu@sun.com> <200802242243.49576.yinghai.lu@sun.com> <20080226194058.GA31438@uranus.ravnborg.org> <Pine.LNX.4.64.0802290443440.2723@scrub.home> <86802c440802282105j2c0d0ce3o551c3afdcc5c2b17@mail.gmail.com> <Pine.LNX.4.64.0802291417140.2723@scrub.home> <20080229174016.GA5696@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080229174016.GA5696@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, Yinghai Lu <yhlu.kernel@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kiran@scalemp.com, shai@scalemp.com, Glauber Costa <gcosta@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>


* Sam Ravnborg <sam@ravnborg.org> wrote:

> > > in x86.git#testing to use Roman's three patches.
> > 
> > Only the first patch needs merging, the other two can wait a little.
> Agreed. I will take the latter two in kbuild.git.
> The first one belong in x86.git.

i've picked up Roman's fix for 2.6.25 merging.

	Ingo
